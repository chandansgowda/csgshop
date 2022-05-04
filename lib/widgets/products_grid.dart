import 'package:csgshop/providers/products.dart';
import 'package:provider/provider.dart';

import '../widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductsGrid extends StatelessWidget {
  bool _showOnlyFavorites;
  ProductsGrid(this._showOnlyFavorites);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = _showOnlyFavorites? productsData.favoriteItems : productsData.items;
    return GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (ctx, index) {
          var product = products[index];
          return ChangeNotifierProvider.value(
            //create: (ctx) => products[index],
            value: products[index],
            child: ProductItem(),
          );
        });
  }
}
