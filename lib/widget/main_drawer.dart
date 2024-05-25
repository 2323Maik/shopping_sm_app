import 'package:flutter/material.dart';
import 'package:shopping_sm_app/pages/Prodact_overview_page.dart';
import 'package:shopping_sm_app/pages/order_detail_screen.dart';

class MainDrawer extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      elevation: 2,
      child: Column(
        children: [
          AppBar(
            title: Text(
              "Route here",
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            automaticallyImplyLeading: false,
          ),
          ListTile(
              leading: const Icon(Icons.shop),
              title: Text(
                "Shoping",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(ProductOverviewScreen.routeName);
              }),
          ListTile(
              leading: const Icon(Icons.payment),
              title: Text(
                "Orders",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(OrderDetailScreen.routeName);
              }),
        ],
      ),
    );
  }
}
