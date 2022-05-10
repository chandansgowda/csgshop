import 'package:csgshop/providers/products.dart';
import 'package:csgshop/screens/edit_product_screen.dart';
import 'package:csgshop/widgets/app_drawer.dart';
import 'package:csgshop/widgets/user_product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = "/user-products";

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Your Products"),actions: [
        IconButton(onPressed: (){
          Navigator.of(context).pushNamed(EditProductScreen.routeName);
        }, icon: Icon(Icons.add))
      ],),
      drawer: MainDrawer(),
      body: Padding(padding: EdgeInsets.all(8), child: ListView.builder(itemBuilder: (ctx, i){
        return Column(
          children: [
            UserProductItem(title: productsData.items[i].title, imageUrl: productsData.items[i].imageUrl),
            Divider()
          ],
        );
      },itemCount: productsData.items.length, ),),
    );
  }
}
