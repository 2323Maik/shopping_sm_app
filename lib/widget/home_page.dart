import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Overview"),
      ),
      body: Container(
        child: Text(
          "Body",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
