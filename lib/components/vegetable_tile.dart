import 'package:flutter/material.dart';

import '../models/vegetable.dart';

class VegetableTile extends StatelessWidget {
  void Function()? onPressed;
  final Widget icon ;
  final Vegetable vegetable;
  VegetableTile({super.key, required this.vegetable, required this.onPressed, required this.icon});

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
          title: Text(vegetable.name),
          subtitle: Text('\$${vegetable.price}'),
          leading: Image.asset(vegetable.imagePath),
          trailing: IconButton(
              icon: icon,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
