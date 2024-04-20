import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Overview"),
      ),
      body: Container(
        child: Text("Body"),
      ),
    );
  }
}
