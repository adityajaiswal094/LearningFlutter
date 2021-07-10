import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:some_app/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  // const CartPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Cart",
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _CartList(),
          ),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "\$${_cart.totalPrice}",
            style: TextStyle(fontSize: 28),
          ),
          WidthBox(30),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 160, height: 40),
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Buying not supported yet.")));
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).buttonColor)),
              child: Text(
                "Place Order",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _cart.items?.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.done),
            trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline), onPressed: () {}),
            title: Text("${_cart.items[index].name}"),
          );
        });
  }
}
