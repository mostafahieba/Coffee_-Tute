import 'package:coffee_tute/Models/Coffee.dart';
import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  final Function()? onpressed;
  final Widget icon;
  CoffeeTile({
    super.key, required this.coffee, required this.onpressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListTile(
        title: Text(coffee.name),
        subtitle: Text(coffee.price),
        leading: Image.asset(coffee.imagepath),
        trailing: IconButton(
            icon: icon,
            onPressed: onpressed),
      ),
    );
  }
}
