import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/screens/home_screen.dart';
import 'package:untitled/viewmodel/add_item_viewmodel.dart';
import 'package:untitled/viewmodel/add_shopname_viewmodel.dart';

void main() {
  runApp(HomeApp());
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ItemAddNotifier>(
          create: (BuildContext context) {
            return ItemAddNotifier();
          },
        ),
        ChangeNotifierProvider<ShopNameNotifier>(
          create: (BuildContext context) {
            return ShopNameNotifier();
          },
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}