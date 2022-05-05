import 'package:csgshop/providers/cart.dart';
import 'package:csgshop/providers/product.dart';
import 'package:csgshop/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  // final String title;
  // final String id;
  // final String imageUrl;
  // final double price;
  // bool? isFavourite;
  //
  // ProductItem(
  //     {required this.title,
  //     required this.imageUrl,
  //     required this.id,
  //     required this.price,
  //     this.isFavourite});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context,listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                  arguments: product.id);
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            leading: IconButton(
              icon: Icon(
                product.isFavourite!?Icons.favorite:Icons.favorite_border,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
            title: Center(child: Text(product.title)),
            backgroundColor: Colors.black87,
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart,
                  color: Theme.of(context).accentColor),
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
              },
            ),
          )),
    );
  }
}
