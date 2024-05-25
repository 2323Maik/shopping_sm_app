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
      body: SingleChildScrollView(
        child: Column(
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
            const SizedBox(
              height: 10,
            ),
            provId.price == 0
                ? Text("0")
                : Text(
                    '\$${provId.price}',
                    style: const TextStyle(color: Colors.grey, fontSize: 18),
                  ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              width: double.infinity,
              alignment: Alignment.center,
              child: provId.description == null
                  ? Text("")
                  : Text(provId.description),
            )
          ],
        ),
      ),
    );
  }
}
