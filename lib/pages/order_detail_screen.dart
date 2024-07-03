import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/order.dart';
import '../widget/main_drawer.dart';

import '../widget/order_items.dart';

class OrderDetailScreen extends StatefulWidget {
  //const OrderDetailScreen({ Key? key }) : super(key: key);
  static const routeName = '/order-detail-screen';
  State<StatefulWidget> createState() => OrderDetailScreenState();
}

class OrderDetailScreenState extends State<OrderDetailScreen> {
  //var _isLoading = false;

  // void initState() {
  //   Future.delayed(Duration.zero).then((_) async {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     await Provider.of<Order>(context, listen: false).featchAndSetOrder();
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   });
  //   super.initState();
  // }

  /*  Here inorder to remove rebuilding featchAndSetOrder() http request inside build method everytime (if other method inside build method rebuild, then this request will also request again )
  */
  Future? _orderProduct;

  Future _obtainOrderProduct() {
    return Provider.of<Order>(context, listen: false).featchAndSetOrder();
  }

  @override
  void initState() {
    _orderProduct = _obtainOrderProduct();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // unless we commented out below provider it will create infinite loop with line 67
    //final ord = Provider.of<Order>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Order Details",
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
        ),
        drawer: MainDrawer(),
        body: /*ord.orderCount <= 0
            ? ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Image.network(
                        'https://rnsecuritysystems.com/Images/empty-cart.png',
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        "Oops! you don't have new order!",
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                ),
              )
            :*/
            FutureBuilder(
          future: _orderProduct,
          //Provider.of<Order>(context, listen: false).featchAndSetOrder(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.error != null) {
              return const Center(
                child: Text("An error has been ocurred"),
              );
            } else {
              return Consumer<Order>(
                  builder: (ctx, value, child) => ListView.builder(
                        itemCount: value.orders.length,
                        itemBuilder: (ctx, i) => OrderItem(value.orders[i]),
                      ));
            }
          },
        ));
  }
}
