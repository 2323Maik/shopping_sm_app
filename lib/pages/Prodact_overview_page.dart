import 'package:flutter/material.dart';

import '../model/prodact.dart';
import '../widget/Product_gridview.dart';

import '../widget/main_drawer.dart';

class ProductOverviewScreen extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);
  //final List<Product> productItem;
  //ProductOverviewScreen(this.productItem);
  final List<Product> loadedProduct = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product Overview"),
        ),
        drawer: MainDrawer(),
        body: ProductGridview());
  }
}
