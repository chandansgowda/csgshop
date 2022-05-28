import 'package:csgshop/providers/cart.dart';
import 'package:csgshop/providers/products.dart';
import 'package:csgshop/screens/cart_screen.dart';
import 'package:csgshop/widgets/app_drawer.dart';
import 'package:csgshop/widgets/badge.dart';
import 'package:csgshop/widgets/products_grid.dart';
import 'package:provider/provider.dart';


import '../providers/product.dart';
import 'package:flutter/material.dart';

enum FilterOptions { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  bool _isInit = true;
  bool _isLoading = false;

  void didChangeDependencies(){
    if (_isInit){
      setState((){
        _isLoading=true;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState((){
          _isLoading=false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("CSG Shop"),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions value) {
                setState(() {
                  if (value == FilterOptions.Favorites)
                    _showOnlyFavorites = true;
                  else
                    _showOnlyFavorites = false;
                });
              },
              child: Icon(Icons.menu_open_sharp),
              itemBuilder: (_) {
                return [
                  PopupMenuItem(
                    child: Text("Show favorites"),
                    value: FilterOptions.Favorites,
                  ),
                  PopupMenuItem(
                    child: Text("Show All"),
                    value: FilterOptions.All,
                  ),
                ];
              }),
          Badge(
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
              value: cart.itemCount.toString()),
        ],
      ),
      body: _isLoading ? Center(child: CircularProgressIndicator(),) : ProductsGrid(_showOnlyFavorites),
      drawer: MainDrawer(),
    );
  }
}
