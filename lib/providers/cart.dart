import 'package:flutter/material.dart';

class CartItem{
  final String id;
  final String title;
  double price;
  int quantity;

  CartItem({
   required this.id,
   required this.title,
   required this.price,
   required this.quantity
});

  CartItem incrementQuantity(){
    quantity++;
    return this;
  }
}

class Cart with ChangeNotifier{
  Map<String,CartItem> _items = {};

  Map<String,CartItem> get items{
    return {..._items};
  }

  double get totalAmount{
    var total = 0.0;
    _items.forEach((key, cartItem){
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  int get itemCount{
    return _items==null ? 0 : _items.length;
  }

  void addItem(String productId, price, title){
    if (_items.containsKey(productId)){
      _items.update(productId, (existingCartItem) => existingCartItem.incrementQuantity());
      //increase quantity
    }else{
      _items.addAll({productId:CartItem(id: DateTime.now().toString(), title: title, price: price, quantity: 1)});
    }
    notifyListeners();
  }
}