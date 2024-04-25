import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_sm_app/Providers/product_providers.dart';
import 'Product_items.dart';

class ProductGridview extends StatelessWidget {
  //const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context); // colling provider class /////
    final products = productProvider.items;
    return GridView.builder(
      itemBuilder: (ctx, index) {
        return ProductItem(
          id: products[index].id,
          title: products[index].title,
          imageURL: products[index].imageURL,
        );
      },
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
