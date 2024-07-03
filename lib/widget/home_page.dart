import 'package:flutter/material.dart';

import '../pages/Prodact_overview_page.dart';

class MyHomePage extends StatelessWidget {
  static const routeName = '/home-screen';
  //const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductOverviewScreen();
  }
}
