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
  void _setFavVal(bool newVal) {
    isFavorite = newVal;
    notifyListeners();
  }

  Future<void> toggleFavorite() async {
    final url =
        'https://shopping-app-39b8d-default-rtdb.firebaseio.com/Products/$id.json';
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    try {
      final response = await http.patch(Uri.parse(url),
          body: json.encode({
            'isFavorite': isFavorite,
          }));
      if (response.statusCode >= 400) {
        _setFavVal(oldStatus);
      }
    } catch (error) {
      _setFavVal(oldStatus);
    }
  }

  void removeFavorite() {
    isFavorite = false;
    notifyListeners();
  }
}
