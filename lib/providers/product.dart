import 'package:flutter/material.dart';

class Product with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  bool? isFavourite;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.price,
      this.isFavourite=false});

  void toggleFavoriteStatus(){
    isFavourite = !isFavourite!;
    notifyListeners();
  }
}
