import 'package:coffee_tute/Models/Coffee_Shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Components/coffee_tile.dart';
import '../Models/Coffee.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
  }
  // pay botton topped

  void payNow() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Consumer<CoffeeShop>(
          builder:
              (context, value, child) => SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      // Heading meassage
                      const Text("Your Cart", style: TextStyle(fontSize: 20)),
                      SizedBox(height: 25),

                      // list of cart items
                      Expanded(
                        child: ListView.builder(
                          itemCount: value.coffeeCart.length,
                          itemBuilder: (context, index) {
                            // get individual cart items
                            Coffee eachCoffee = value.coffeeCart[index];
                            //return coffee tile
                            return CoffeeTile(
                              coffee: eachCoffee,
                              onpressed: () => removeFromCart(eachCoffee),
                              icon: Icon(Icons.delete),
                            );
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: payNow,
                        child: Container(
                          padding: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(child: Center(
                            child: Text("Pay Now",
                                style: TextStyle(color: Colors.white)),
                          )),
                        )
                      )
                    ],
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
