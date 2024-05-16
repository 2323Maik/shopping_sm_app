import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopping_sm_app/Providers/prodact.dart';
import '../Providers/cart.dart';
import '../pages/Product_details_page.dart';

class ProductItem extends StatelessWidget {
  //const ProductItem({ Key? key }) : super(key: key);
  // final String id;
  // final String title;
  // final String imageURL;

  // ProductItem({
  //   required this.id,
  //   required this.title,
  //   required this.imageURL,
  // });

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    //final cart = ;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          title: Text(
            product.title,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: "Quicksand",
                fontSize: 16,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          leading: Consumer<Product>(
            /////// we used consumer here to rebuild only the iconbutton
            builder: (ctx, ppp, _) => IconButton(
              icon: Icon(
                  ppp.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.pink),
              onPressed: () {
                ppp.toggleFavorite();
              },
            ),
            //////////// child:Text(""),
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.yellowAccent,
            ),
            onPressed: () {
              Provider.of<Cart>(context, listen: false).addItemToCart(
                product.id,
                product.title,
                product.price,
              );
            },
          ),
          backgroundColor: Colors.black26,
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageURL,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
