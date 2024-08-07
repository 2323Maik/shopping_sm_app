import 'dart:convert'; // for converting object to json format

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_sm_app/model/http_exeptionError.dart';

import 'prodact.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _items = [
    /*Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageURL:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageURL:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageURL:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageURL:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),*/
  ];

  List<Product> get items {
    return [..._items];
    // if (_showFavorite) {
    //   return _items.where((element) => element.isFavorite).toList();
    // } else {
    //   return [..._items];
    // }
  }

  List<Product> get findFav {
    return items.where((element) => element.isFavorite).toList();
  }
  // void showFavorite() {
  //   _showFavorite = true;
  //   notifyListeners();
  // }

  // void showAllItems() {
  //   _showFavorite = false;
  //   notifyListeners();
  // }

  Product findId(String id) {
    return items.firstWhere((val) => val.id == id);
  }

  // get data from firebase
  Future<void> fetchAndSetProducts() async {
    final url =
        'https://shopping-app-39b8d-default-rtdb.firebaseio.com/Products.json';
    final List<Product> loadedProducts = [];
    try {
      final respone = await http.get(Uri.parse(url));
      //print(json.decode(respone.body));
      final extractedData = json.decode(respone.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((key, value) {
        loadedProducts.add(Product(
          id: key,
          title: value['title'],
          description: value['description'],
          imageURL: value['imageURL'],
          price: value['price'],
          isFavorite: value['isFavorite'],
        ));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

// adding a Future object for spinner below
  Future<void> addProduct(Product product) async {
    final url =
        'https://shopping-app-39b8d-default-rtdb.firebaseio.com/Products.json';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          "title": product.title,
          "description": product.description,
          "imageURL": product.imageURL,
          "isFavorite": product.isFavorite,
          "price": product.price
        }),
      );
      //print(json.decode(response.body));
      final newProduct = Product(
        id: json.decode(response.body)['name'],
        title: product.title,
        description: product.description,
        imageURL: product.imageURL,
        price: product.price,
      );
      _items.add(newProduct); // adding new product to items list
      notifyListeners();
    } catch (error) {
      throw error;
    }
    //print('this is new product: $newProduct');
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    var prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex != "") {
      final url =
          'https://shopping-app-39b8d-default-rtdb.firebaseio.com/Products/$id.json';
      await http.patch(
        Uri.parse(url),
        body: json.encode({
          'title': newProduct.title,
          'description': newProduct.description,
          'imageURL': newProduct.imageURL,
          'price': newProduct.price
        }),
      );
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print("");
    }
  }

  Future<void> removeProduct(String pId) async {
    final url =
        'https://shopping-app-39b8d-default-rtdb.firebaseio.com/Products/$pId.json';
    final existingProductIndex =
        _items.indexWhere((curentId) => curentId.id == pId);

    /// storing product in a memory for reserve
    Product? exstingProduct = _items[existingProductIndex];

    final response = await http.delete(Uri.parse(url));

    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, exstingProduct!);
      notifyListeners();

      throw HTTPException('Could no delete this items');
    }
    exstingProduct = null;

    /// removing Item from List
    _items.removeAt(existingProductIndex);
    notifyListeners();
  }
}
