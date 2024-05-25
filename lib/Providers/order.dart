import 'package:flutter/material.dart';
import 'package:shopping_sm_app/Providers/cart.dart';

class OrderData {
  final String id;
  final double amount;
  final List<CartItem> productTtems;
  final DateTime dateTimes;
  OrderData({
    required this.amount,
    required this.dateTimes,
    required this.id,
    required this.productTtems,
  });
}

class Order with ChangeNotifier {
  List<OrderData> _orders = [];

  List<OrderData> get orders {
    return [..._orders];
  }

  void addOrders(List<CartItem> products, double total) {
    _orders.insert(
      0,
      OrderData(
        amount: total,
        dateTimes: DateTime.now(),
        id: DateTime.now().toString(),
        productTtems: products,
      ),
    );
    notifyListeners();
  }

  int get orderCount {
    return _orders.length;
  }
}
