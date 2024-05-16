import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_sm_app/Providers/cart.dart';
//import 'package:badges/badges.dart' as badges;
// import 'package:provider/provider.dart';

// import '../Providers/product_providers.dart';
import '../widget/badge.dart';
import '../widget/Product_gridview.dart';

import '../widget/main_drawer.dart';

enum FilterOption {
  favorites,
  showAll,
}

class ProductOverviewScreen extends StatefulWidget {
  State<StatefulWidget> createState() => ProductOverviewScreenState();
}

//const ({ Key? key }) : super(key: key);
//final List<Product> productItem;
//ProductOverviewScreen(this.productItem);
//final List<Product> loadedProduct = [];
class ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    //final providerProv = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Overview"),
        actions: [
          Consumer<Cart>(
            builder: (_, carts, ch) => MyBadges(
              value: carts.itemCount.toString(),
              child: IconButton(
                onPressed: () {
                  print(carts.itemCount);
                },
                icon: Icon(Icons.shopping_cart),
                color: Colors.yellowAccent,
              ),
            ),
          ),
          PopupMenuButton(
            itemBuilder: (ctx) => [
              PopupMenuItem(
                  child: Text("Favorites",
                      style: Theme.of(context).textTheme.bodySmall),
                  value: FilterOption.favorites),
              PopupMenuItem(
                  child: Text("Show All",
                      style: Theme.of(context).textTheme.bodySmall),
                  value: FilterOption.showAll),
            ],
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onSelected: (FilterOption SelectedValue) {
              setState(() {
                if (SelectedValue == FilterOption.favorites) {
                  //providerProv.showFavorite();
                  showFavoriteOnly = true;
                } else {
                  //providerProv.showAllItems();
                  showFavoriteOnly = false;
                }
              });
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: ProductGridview(showFavoriteOnly),
    );
  }
}
