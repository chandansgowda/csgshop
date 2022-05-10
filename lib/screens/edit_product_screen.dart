import 'package:csgshop/providers/product.dart';
import 'package:csgshop/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = "/edit-product-screen";

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _imageUrlController = TextEditingController();
  final _form = FormState();
  var _editedProduct = Product(id: DateTime.now().toString(), title: "", description: "", imageUrl: "", price: 0);

  void _saveForm(){
    _form.save();
    Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
        actions: [
          IconButton(onPressed: _saveForm, icon: Icon(Icons.save)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(label: Text("Title")),
                  textInputAction: TextInputAction.next,
                  onSaved: (value){
                    _editedProduct = Product(id: _editedProduct.id, title: value.toString(), description: _editedProduct.description, imageUrl: _editedProduct.imageUrl, price: _editedProduct.price);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(label: Text("Price")),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onSaved: (value){
                    _editedProduct = Product(id: _editedProduct.id, title: _editedProduct.title, description: _editedProduct.description, imageUrl: _editedProduct.imageUrl, price: double.parse(value!));
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(label: Text("Description")),
                  maxLines: 3,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.multiline,
                  onSaved: (value){
                    _editedProduct = Product(id: _editedProduct.id, title: _editedProduct.title, description: value!, imageUrl: _editedProduct.imageUrl, price: _editedProduct.price);
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(top: 8, right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey)
                      ),
                      child: _imageUrlController.text.isEmpty? Text("Enter a URL") : FittedBox(child: Image.network(_imageUrlController.text, fit: BoxFit.cover,),),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(label: Text("Image Url")),
                        keyboardType: TextInputType.url,
                        controller: _imageUrlController,
                        textInputAction: TextInputAction.done,
                        onSaved: (value){
                          _editedProduct = Product(id: _editedProduct.id, title: _editedProduct.title, description: _editedProduct.description, imageUrl: value!, price: _editedProduct.price);
                        },
                        onFieldSubmitted: (_){
                          setState(() {
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            )
        ),
      ),

    );
  }
}
