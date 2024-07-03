import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_sm_app/Providers/cart.dart';
import 'package:http/http.dart' as http;

class OrderData {
  final String id;
  final double amount;
  final List<CartItem> productItems;
  final DateTime dateTimes;
  OrderData({
    required this.amount,
    required this.dateTimes,
    required this.id,
    required this.productItems,
  });
}

class Order with ChangeNotifier {
  List<OrderData> _orders = [];

  List<OrderData> get orders {
    return [..._orders];
  }

  Future<void> featchAndSetOrder() async {
    final url =
        'https://shopping-app-39b8d-default-rtdb.firebaseio.com/orders.json';
    final List<OrderData> loadedProduct = [];
    final response = await http.get(Uri.parse(url));
    final extractedProduct = json.decode(response.body) as Map<String, dynamic>;
    if (extractedProduct == null) {
      return;
    }
    extractedProduct.forEach((key, value) {
      loadedProduct.add(OrderData(
          amount: value['amount'],
          dateTimes: DateTime.parse(value['dateTimes']),
          id: key,
          productItems: (value['productItems'] as List<dynamic>)
              .map(
                (items) => CartItem(
                    id: items['id'],
                    price: items['price'],
                    quantity: items['quantity'],
                    title: items['title']),
              )
              .toList()));
    });

    _orders = loadedProduct;
    notifyListeners();
  }

  Future<void> addOrders(List<CartItem> products, double total) async {
    final url =
        'https://shopping-app-39b8d-default-rtdb.firebaseio.com/orders.json';
    final timestamp = DateTime.now();
    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            'amount': total,
            'dateTimes': timestamp.toIso8601String(),
            'productItems': products
                .map((e) => {
                      'id': e.id,
                      'title': e.title,
                      'price': e.price,
                      'quantity': e.quantity,
                    })
                .toList()
          }));
      _orders.insert(
        0,
        OrderData(
          amount: total,
          dateTimes: timestamp,
          id: json.decode(response.body)['name'],
          productItems: products,
        ),
      );
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  int get orderCount {
    return _orders.length;
  }
}
