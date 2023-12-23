import 'package:flutter/material.dart';

import '../models/fruit.dart';


class FruitTile extends StatelessWidget {
  void Function()? onPressed;
  final Widget icon ;
  final Fruit fruit;
  FruitTile({super.key, required this.fruit, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: ListTile(
          title: Text(fruit.name),
          subtitle: Text('\$${fruit.price}'),
          leading: Image.asset(fruit.imagePath),
          trailing: IconButton(
            icon: icon,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
