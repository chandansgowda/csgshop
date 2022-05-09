import 'package:csgshop/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String id, title, productId;
  final int quantity;
  final double price;

  CartItem({
    required  this.id,
    required  this.productId,
    required  this.title,
    required  this.quantity,
    required  this.price,
});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      onDismissed: (direction) => Provider.of<Cart>(context, listen: false).removeItem(productId),
      confirmDismiss: (direction) => showDialog(context: context, builder: (ctx) => AlertDialog(
          title: Text('Are you sure? '),
          content: Text('Do you want to remove the item from the cart?'),
          actions: [
            FlatButton(onPressed: (){Navigator.of(context).pop(false);}, child: Text("No")),
            FlatButton(onPressed: (){Navigator.of(context).pop(true);}, child: Text("Yes")),
          ],
        )),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(Icons.delete, color: Colors.white,),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      child: Card(margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),child: Padding(padding: EdgeInsets.all(8),child: ListTile(
        leading: CircleAvatar(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FittedBox(child: Text("\$$price")),
        ),),
        title: Text(title),
        subtitle: Text('Total : \$${(price*quantity)}'),
        trailing: Text('$quantity x'),
      ),),),
    );
  }
}
