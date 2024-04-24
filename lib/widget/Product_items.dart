import 'package:flutter/material.dart';
import '../pages/Product_details_page.dart';

class ProductItem extends StatelessWidget {
  //const ProductItem({ Key? key }) : super(key: key);
  final String id;
  final String title;
  final String imageURL;

  ProductItem({
    required this.id,
    required this.title,
    required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          title: Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: "Quicksand",
                fontSize: 16,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
            icon: const Icon(Icons.favorite, color: Colors.pink),
            onPressed: () {},
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.yellowAccent,
            ),
            onPressed: () {},
          ),
          backgroundColor: Colors.black26,
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetailScreen.routeName, arguments: id);
          },
          child: Image.network(
            imageURL,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
