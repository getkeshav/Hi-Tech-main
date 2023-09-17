import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/utils/error_msg.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:velocity_x/velocity_x.dart';
import 'core/store.dart';
import 'firebase_options.dart';
import 'pages/home_page.dart';
import 'utils/error_msg.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Stripe.publishableKey = 'pk_test_51NrHXpSDFjRibsIYioLSL1B48xs3ZBWC4uB1mps6ckZMvoeM20zNuhP68g6kVesqaL65atTToz1p7qSU0uuorgAR00LKgR3xG4';
  await Stripe.instance.applySettings();
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override // build fn is over written again and again to implement the changes
  Widget build(BuildContext context) {
    //context specify location of each widget in widget tree
    return MaterialApp(
      // scaffoldMessengerKey: Utils.messengerKey,
      themeMode: ThemeMode.system,
      theme: MyTheme.lighttheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      home: (FirebaseAuth.instance.currentUser != null)
          ? HomePage()
          : LoginPage(),

      //  initialRoute:
      //       "login",
      //this is the 1st route we want to show on screen when app opens

      // routes: {
      //   "/": (context) => LoginPage(), //by default initial route is "/"
      //   MyRoutes.homeRoute: (context) => HomePage(),
      //   MyRoutes.loginRoute: (context) => LoginPage(),
      //   MyRoutes.CartRoute: (context) => CartPage(),
      // },
    );
  }
}
