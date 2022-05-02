import 'package:csgshop/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  bool? isFavourite;

  ProductItem(
      {required this.title,
      required this.imageUrl,
      required this.price,
      this.isFavourite});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
          child: GestureDetector(
            onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailScreen(title: title,)));},
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            leading: IconButton(icon: Icon(Icons.favorite,color: Theme.of(context).accentColor,),onPressed: (){},),
            title: Center(child: Text(title)),
            backgroundColor: Colors.black87,
            trailing: IconButton(icon: Icon(Icons.add_shopping_cart,color: Theme.of(context).accentColor ),onPressed: (){},),
          )),
    );
  }
}
