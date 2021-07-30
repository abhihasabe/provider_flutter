import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/viewmodel/add_item_viewmodel.dart';
import 'package:untitled/viewmodel/add_shopname_viewmodel.dart';

class AddItemScreen extends StatelessWidget{

  TextEditingController _itemNameController = TextEditingController();
  TextEditingController _shopNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Add Item"),),
      body: Column(children: [
        TextField(
          controller: _itemNameController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15.0),
            hintText: 'Item Name',
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        RaisedButton(
          child: Text('ADD ITEM'),
          onPressed: () async {
            if (_itemNameController.text.isEmpty) {
              return;
            }
            await Provider.of<ItemAddNotifier>(context, listen: false).addItem(_itemNameController.text);
            Navigator.pop(context);
          },
        ),
        SizedBox(
          height: 20.0,
        ),
        RaisedButton(
          child: Text('ADD ITEM SCREEN'),
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) {
                  return AddItemScreen();
                },
              ),
            );
          },
        ),
        TextField(
          controller: _shopNameController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15.0),
            hintText: 'Shop Name',
          ),
        ),
        RaisedButton(
          child: Text('UPDATE SHOP'),
          onPressed: () async {
            if (_shopNameController.text.isEmpty) {
              return;
            }
            await Provider.of<ShopNameNotifier>(context, listen: false).updateShopName(_shopNameController.text);
            Navigator.pop(context);
          },
        ),
      ])
    );
  }

}