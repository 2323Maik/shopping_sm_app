import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/product_providers.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = "/product-detail-page";
  //const ProductDetailScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final provId =
        Provider.of<ProductProvider>(context, listen: false).findId(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(provId.title),
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Image.network(
                provId.imageURL!,
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
