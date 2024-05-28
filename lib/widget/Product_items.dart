import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopping_sm_app/Providers/prodact.dart';
import '../Providers/cart.dart';
import '../pages/Product_details_page.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
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
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                product.isFavorite
                    ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text("Added to favorite"),
                        backgroundColor: Colors.black45,
                        duration: const Duration(seconds: 3),
                        //showCloseIcon: true,
                        action: SnackBarAction(
                          label: "UNDO",
                          textColor: Colors.amber,
                          onPressed: () {
                            product.removeFavorite();
                          },
                        ),
                      ))
                    : null;
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
              cart.addItemToCart(
                product.id,
                product.title,
                product.price,
              );
              ScaffoldMessenger.of(context)
                  .hideCurrentSnackBar(); // to hide current snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("Added item to cart"),
                  duration: const Duration(seconds: 3),
                  backgroundColor: Colors.black45,
                  //backgroundColor: const Color.fromRGBO(0, 153, 202, .6),
                  action: SnackBarAction(
                    textColor: Colors.amber,
                    label: "UNDO",
                    onPressed: () {
                      cart.removeSingleItem(product.id);
                    },
                  ),
                ),
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
