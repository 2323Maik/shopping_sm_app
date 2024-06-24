import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imageURL;
  final double price;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.imageURL,
    required this.price,
    this.isFavorite = false,
  });

  Future<void> toggleFavorite() async {
    final url =
        'https://shopping-app-39b8d-default-rtdb.firebaseio.com/Products.json';
    http.post(Uri.parse(url), body: json.encode({}));
    isFavorite = !isFavorite;

    notifyListeners();
  }

  void removeFavorite() {
    isFavorite = false;
    notifyListeners();
  }
}
