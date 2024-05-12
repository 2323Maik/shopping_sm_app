import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:shopping_sm_app/Providers/product_providers.dart';

import 'Product_items.dart';

class ProductGridview extends StatelessWidget {
  //const MyWidget({super.key});
  final bool showFav;
  ProductGridview(this.showFav);

  @override
  Widget build(BuildContext context) {
    final productProv =
        Provider.of<ProductProvider>(context); // colling provider class /////
    final products = showFav ? productProv.findFav : productProv.items;
    return GridView.builder(
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        //// We have to commented out /create/ object since this is not the initial object inistantiation
        ///////create: (c) => products[index],
        value: products[index],
        child: ProductItem(
            // id: products[index].id,
            // title: products[index].title,
            // imageURL: products[index].imageURL,
            ),
      ),
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
