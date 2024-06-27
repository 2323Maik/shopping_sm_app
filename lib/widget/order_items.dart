import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping_sm_app/Providers/order.dart';

class OrderItem extends StatefulWidget {
  //const OrderItem({ Key? key }) : super(key: key);
  final OrderData orders;
  OrderItem(this.orders);
  State<StatefulWidget> createState() => OrderItemState();
}

class OrderItemState extends State<OrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        elevation: 1,
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Total amount \$${widget.orders.amount.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: Text(
                ' Orderd on ${DateFormat('dd MM yyyy').format(widget.orders.dateTimes)}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              trailing: IconButton(
                icon: Icon(
                  _expanded ? Icons.expand_less : Icons.expand_more,
                ),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
              ),
            ),
            if (_expanded)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                height: min(widget.orders.productItems.length * 20.0 + 20, 100),
                child: ListView(children: [
                  ...widget.orders.productItems.map((e) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          e.title,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          '${e.quantity} x \$${e.price}',
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    );
                  }).toList(),
                ]),
              )
          ],
        ));
  }
}
