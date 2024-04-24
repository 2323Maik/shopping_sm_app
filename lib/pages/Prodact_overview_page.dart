import 'package:flutter/material.dart';
import 'package:shopping_sm_app/model/prodact.dart';
import 'package:shopping_sm_app/widget/Product_items.dart';

import '../widget/main_drawer.dart';

class ProductOverviewScreen extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);
  //final List<Product> productItem;
  //ProductOverviewScreen(this.productItem);
  final List<Product> loadedProduct = [
    Product(
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
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product Overview"),
        ),
        drawer: MainDrawer(),
        body: GridView.builder(
          itemBuilder: (ctx, index) {
            return ProductItem(
              id: loadedProduct[index].id,
              title: loadedProduct[index].title,
              imageURL: loadedProduct[index].imageURL,
            );
          },
          itemCount: loadedProduct.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        ));
  }
}
