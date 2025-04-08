import 'package:coffee_tute/const.dart';
import 'package:flutter/material.dart';
import 'package:coffee_tute/Components/bottom_nav_bar.dart';
import 'Cart_page.dart';
import 'Shop_page.dart';

class HomePageState extends StatefulWidget {

  const HomePageState({super.key});


  @override
  State<HomePageState> createState() => _HomeState();
}

class _HomeState extends State<HomePageState> {
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;

    });
  }
  final List<Widget> _pages = [
    ShopPage(),
    CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
