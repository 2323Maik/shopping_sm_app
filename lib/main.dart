import 'package:flutter/material.dart';

import '../widget/home_page.dart';

void main() => runApp(ShoppingApp());

class ShoppingApp extends StatelessWidget {
  //const ShoppingApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        errorColor: Colors.redAccent,
        fontFamily: "Quicksand",
        textTheme: TextTheme(
          bodyLarge: const TextStyle(
            fontSize: 20,
            fontFamily: "OpenSans",
            fontWeight: FontWeight.w300,
            color: Color.fromRGBO(50, 76, 105, 1),
          ),
          bodyMedium: const TextStyle(
            fontSize: 18,
            fontFamily: "Quicksand",
            fontWeight: FontWeight.w300,
            color: Color.fromRGBO(50, 76, 105, 1),
          ),
          bodySmall: const TextStyle(
            fontSize: 15,
            fontFamily: "Quicksand",
            fontWeight: FontWeight.normal,
            color: Color.fromRGBO(50, 76, 105, 1),
          ),
        ),
        appBarTheme: AppBarTheme(
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
      home: MyHomePage(),
    );
  }
}
