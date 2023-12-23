import 'package:flutter/material.dart';
import 'fruit.dart';

class FruitShop extends ChangeNotifier{
  final List<Fruit> _shop2 = [
    Fruit(
        name: 'Apple',
        price: 1.36,
        imagePath: 'assets/fruit_images/apple.png'
    ),

    Fruit(
        name: 'Grapes',
        price: 0.25,
        imagePath: 'assets/fruit_images/grapes.png'
    ),

    Fruit(
        name: 'Banana',
        price: 2.84,
        imagePath: 'assets/fruit_images/banana.png'
    ),

    Fruit(
        name: 'Mango',
        price: 2.34,
        imagePath: 'assets/fruit_images/mango.png'
    ),
  ];

  List<Fruit> _userCart2=[];

  List<Fruit> get fruitShop => _shop2 ;

  List<Fruit> get userCart2 => _userCart2 ;

  void addItemToCart2(Fruit fruit){
    _userCart2.add(fruit);
    notifyListeners();
  }

  void removeItemFromCart2(Fruit fruit){
    _userCart2.remove(fruit);
    notifyListeners();
  }

  double calculateTotal2(){
    double totalPrice = 0 ;
    for(int i=0 ; i < _userCart2.length ; i++){
      totalPrice += _userCart2[i].price ;
    }
    return totalPrice ;
  }

  void emptyCart2(){
    _userCart2.clear();
  }

}