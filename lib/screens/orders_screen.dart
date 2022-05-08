import 'package:csgshop/providers/orders.dart' show Orders;
import 'package:csgshop/widgets/app_drawer.dart';
import 'package:csgshop/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = "/orders";

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context).orders;
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders Screen"),
      ),
      drawer: MainDrawer(),
      body: ListView.builder(itemBuilder: (ctx, i){
        return OrderItem(orders[i]);
      }, itemCount: orders.length,),
    );
  }
}
