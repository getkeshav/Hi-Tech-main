import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import '../core/store.dart';
import '../models/cart.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences logindata;
  late String email;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  Future<void> loadData() async {
    http.Response response;

    try {
      response = await http.get(Uri.parse(
          "https://getkeshav.github.io/ApiLink/product_list.json"));

      if (true) {
        final dynamic jsonData = json.decode(response.body);

        // Print the response to inspect its structure
        // print(jsonData);

        // Check if the response contains the expected data structure
        if (jsonData is Map<String, dynamic> && jsonData.containsKey('data')) {
          CatalogModel.items = (jsonData['data'] as List<dynamic>)
              .map<Item>((item) => Item.fromJson(item))
              .toList();

          setState(() {});
        } else {
          print('JSON structure does not contain "data"');
          // Handle the case where "data" key is missing
          // For example, you could show an error message to the user or take appropriate action.
        }
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error loading data: $e');
      // Handle other errors, e.g., network errors or JSON parsing errors.
      // For example, you could show an error message to the user or take appropriate action.
    }
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (ctx, _, status) => FloatingActionButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CartPage())),
          backgroundColor: context.theme.splashColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
          color: Vx.gray200,
          size: 22,
          count: _cart.items.length,
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 30,
        actions: [
          IconButton(
            onPressed: () {
              logOut();
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Catalogheader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
