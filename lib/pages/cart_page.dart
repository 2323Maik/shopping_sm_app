import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/cart.dart';
import '../widget/cart_items.dart';

class CartScreen extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);
  static const routeName = '/cart-screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart detail",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Column(
        children: [
          Card(
            margin:
                const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 5),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    "Total ",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(width: 5),
                  Chip(
                    label: Text('\$${cart.totalAmount.toStringAsFixed(3)}'),
                    backgroundColor: const Color.fromRGBO(0, 153, 202, 0.6),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Order Now",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 153, 202, 1),
                        ),
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (context, index) => CartItems(
                  id: cart.items.values.toList()[index].id,
                  price: cart.items.values.toList()[index].price,
                  quantity: cart.items.values.toList()[index].quantity,
                  title: cart.items.values.toList()[index].title),
            ),
          )
        ],
      ),
    );
  }
}
