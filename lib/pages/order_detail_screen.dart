import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/order.dart';
import '../widget/main_drawer.dart';

import '../widget/order_items.dart';

class OrderDetailScreen extends StatelessWidget {
  //const OrderDetailScreen({ Key? key }) : super(key: key);
  static const routeName = '/order-detail-screen';

  @override
  Widget build(BuildContext context) {
    final ord = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order Details",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      drawer: MainDrawer(),
      body: ord.orderCount <= 0
          ? ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Image.network(
                      'https://rnsecuritysystems.com/Images/empty-cart.png',
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "Oops! Your order page is Empty!",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
            )
          : ListView.builder(
              itemCount: ord.orders.length,
              itemBuilder: (ctx, i) => OrderItem(ord.orders[i]),
            ),
    );
  }
}
