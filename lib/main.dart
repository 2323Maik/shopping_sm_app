import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_sm_app/Providers/order.dart';
import 'package:shopping_sm_app/pages/Prodact_overview_page.dart';
import 'package:shopping_sm_app/pages/order_detail_screen.dart';
import '../pages/user_product_screen.dart';

import '../Providers/cart.dart';
import '../pages/cart_page.dart';
import '../Providers/product_providers.dart';
import '../pages/Product_details_page.dart';

import '../widget/home_page.dart';

void main() => runApp(ShoppingApp());

class ShoppingApp extends StatelessWidget {
  //const ShoppingApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // ////////////// Here is registering the provider class ///////
          //// We have use Create instade of Value since this is the initial object inistantiation
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Order(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          errorColor: Colors.redAccent,
          fontFamily: "Quicksand",
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              fontSize: 20,
              fontFamily: "OpenSans",
              fontWeight: FontWeight.w300,
              color: Color.fromRGBO(50, 76, 105, 1),
            ),
            bodyMedium: TextStyle(
              fontSize: 18,
              fontFamily: "Quicksand",
              fontWeight: FontWeight.w300,
              color: Color.fromRGBO(50, 76, 105, 1),
            ),
            bodySmall: TextStyle(
              fontSize: 16,
              fontFamily: "Quicksand",
              fontWeight: FontWeight.normal,
              color: Color.fromRGBO(50, 76, 105, 1),
            ),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromRGBO(0, 153, 202, 1),
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontFamily: "OpenSans",
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        //home: MyHomePage(),
        initialRoute: '/',
        routes: {
          '/': (context) => MyHomePage(),
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          ProductOverviewScreen.routeName: (context) => ProductOverviewScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          OrderDetailScreen.routeName: (context) => OrderDetailScreen(),
          UserProductScreen.routeName: (context) => UserProductScreen(),
        },
      ),
    );
  }
}
