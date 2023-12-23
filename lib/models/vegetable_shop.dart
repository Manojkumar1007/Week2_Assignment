import 'package:flutter/material.dart';
import 'vegetable.dart';

class VegetableShop extends ChangeNotifier{
  // vegetable for sale list
  final List<Vegetable> _shop= [
    //cauliflower
    Vegetable(
        name: 'Cauliflower',
        price: 2.36,
        imagePath: 'assets/vegetable_images/cauliflower.png'
    ),
    //potatoes
    Vegetable(
        name: 'Potatoes',
        price: 1.25,
        imagePath: 'assets/vegetable_images/potato.png'
    ),

    //beans
    Vegetable(
        name: 'Beans',
        price: 0.84,
        imagePath: 'assets/vegetable_images/beans.png'
    ),

    //cabbage
    Vegetable(
        name: 'Cabbage',
        price: 1.34,
        imagePath: 'assets/vegetable_images/cabbage.png'
    ),
  ];



  //user cart
  List<Vegetable> _userCart=[];


  //get vegetable list
  List<Vegetable> get vegetableShop => _shop ;

  //get user cart
  List<Vegetable> get userCart => _userCart ;

  //add item to cart
  void addItemToCart(Vegetable vegetable){
    _userCart.add(vegetable);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Vegetable vegetable){
    _userCart.remove(vegetable);
    notifyListeners();
  }

  //add total price of items in cart
  double calculateTotal(){
    double totalPrice = 0 ;
    for(int i=0 ; i < _userCart.length ; i++){
      totalPrice += _userCart[i].price ;
    }
    return totalPrice ;
  }

  void emptyCart(){
    _userCart.clear();
  }

}