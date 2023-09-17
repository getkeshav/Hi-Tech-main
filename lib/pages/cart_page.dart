import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/pages/stripe_page.dart';
import 'package:velocity_x/velocity_x.dart';
import '../core/store.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.canvasColor,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: VxBuilder(
              mutations: {RemoveMutation},
              builder: (context, _, state) {
                final totalPrice =
                    _cart?.totalPrice ?? 0; // Default to 0 if _cart is null
                return "\$$totalPrice"
                    .text
                    .xl5
                    .color(context.theme.hintColor)
                    .make();
              },
            ),
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              final totalPrice =
                  _cart?.totalPrice ?? 0; // Calculate the total price here
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => PaymentScreen(
                      totalPrice: totalPrice), // Pass the total price
                ),
              );
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.splashColor)),
            child: "Buy".text.white.make(),
          ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () => RemoveMutation(_cart.items[index]),
              ),
              title: _cart.items[index].productTitle?.text.make(),
            ),
          );
  }
}
