import 'package:flutter/material.dart';

import '../widget/home_page.dart';

void main() => runApp(ShoppingApp());

class ShoppingApp extends StatelessWidget {
  //const ShoppingApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
