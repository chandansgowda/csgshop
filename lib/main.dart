import 'package:csgshop/providers/cart.dart';
import 'package:csgshop/providers/orders.dart';
import 'package:csgshop/providers/products.dart';
import 'package:csgshop/screens/cart_screen.dart';
import 'package:csgshop/screens/orders_screen.dart';
import 'package:csgshop/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

import '../screens/products_overview_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProvider(create: (ctx) =>  Cart()),
        ChangeNotifierProvider(create: (ctx) =>  Orders()),
      ],
      child: MaterialApp(
        title: 'CSG Shop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen()
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CSG Shop'),
      ),
      body: Center(
        child: Text('Let\'s build a shop!'),
      ),
    );
  }
}
