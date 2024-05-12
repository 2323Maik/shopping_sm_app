import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem({
    required this.id,
    required this.price,
    required this.quantity,
    required this.title,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItemToCart(
    String productId,
    String title,
    double price,
  ) {
    if (items.containsKey(productId)) {
      items.update(
        productId,
        (exixtingvalue) => CartItem(
          id: exixtingvalue.id,
          price: exixtingvalue.price,
          quantity: exixtingvalue.quantity + 1,
          title: exixtingvalue.title,
        ),
      );
    } else {
      items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          price: price,
          quantity: 1,
          title: title,
        ),
      );
    }
    notifyListeners();
  }
}
