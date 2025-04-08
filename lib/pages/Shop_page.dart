import 'package:coffee_tute/Models/Coffee.dart';
import 'package:coffee_tute/Models/Coffee_Shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Components/coffee_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add coffee to cart
  void addToCart(Coffee coffee) {
    // add to cart
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);
    // let uesr Know it add been successfully added to cart
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              'Successfully added to cart',
              style: TextStyle(fontSize: 18, color: Colors.brown),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder:
          (context, value, child) => SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  // Heading meassage
                  Container(
                    padding: const EdgeInsets.all(12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.brown),
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "How would you like your coffee?",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 25),

                  //list of coffee to buy
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.coffeeShop.length,
                      itemBuilder: (context, index) {
                        // get individual coffee
                        Coffee eachCoffee = value.coffeeShop[index];

                        // return the tile for coffee
                        return CoffeeTile(
                          coffee: eachCoffee,
                          icon: Icon(Icons.add),
                          onpressed: () => addToCart(eachCoffee),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
