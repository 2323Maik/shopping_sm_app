import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_sm_app/Providers/product_providers.dart';
import 'package:shopping_sm_app/widget/user_product_item.dart';
import '../widget/main_drawer.dart';

class UserProductScreen extends StatelessWidget {
  //const UserProductScreen({ Key? key }) : super(key: key);
  static const routeName = 'user-product-screen';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Products",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
        child: ListView.builder(
          itemBuilder: (ctx, index) => UserProductItem(
            productData.items[index].title,
            productData.items[index].imageURL,
          ),
          itemCount: productData.items.length,
        ),
      ),
    );
  }
}
