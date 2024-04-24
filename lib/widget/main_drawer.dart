import 'dart:ui';

import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      elevation: 2,
      child: Column(
        children: [
          Container(
            //height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).appBarTheme.backgroundColor,
            child: Text(
              "Overview",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: "Quicksand",
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
