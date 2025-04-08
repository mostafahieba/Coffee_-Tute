import 'package:coffee_tute/Models/Coffee_Shop.dart';
import 'package:coffee_tute/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create:(context)=> CoffeeShop(),
    builder: (context, child )=> const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageState(),
    ),);
  }
}
