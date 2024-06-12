import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_sm_app/pages/edit_product_screen.dart';
import '../Providers/product_providers.dart';
import '../widget/user_product_item.dart';
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
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
            icon: const Icon(Icons.add),
          )
        ],
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
        child: ListView.builder(
          itemBuilder: (ctx, index) => Dismissible(
            key: ValueKey(productData),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.redAccent,
              margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
            ),
            child: UserProductItem(
              productData.items[index].id,
              productData.items[index].title,
              productData.items[index].imageURL,
            ),
          ),
          itemCount: productData.items.length,
        ),
      ),
    );
  }
}
