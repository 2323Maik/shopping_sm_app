import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/cart.dart';

class CartItems extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);
  final String id;
  final String productId;
  final double price;
  final String title;
  final int quantity;

  CartItems({
    required this.id,
    required this.productId,
    required this.price,
    required this.quantity,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(productId),
      background: Container(
        color: Colors.redAccent,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeCart(productId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color.fromRGBO(0, 153, 202, .5),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: FittedBox(
                child: Text('\$$price'),
              ),
            ),
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            'Total \$${(price * quantity).toStringAsFixed(4)}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          trailing: Text(
            '$quantity x',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
    );
  }
}
