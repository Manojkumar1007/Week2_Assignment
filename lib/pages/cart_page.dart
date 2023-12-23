import 'package:basics/components/fruit_tile.dart';
import 'package:basics/components/vegetable_tile.dart';
import 'package:basics/models/fruit_shop.dart';
import 'package:basics/models/vegetable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/fruit.dart';
import '../models/vegetable_shop.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  void removeFromCart(Vegetable vegetable){
    Provider.of<VegetableShop>(context,listen: false).removeItemFromCart(vegetable);
  }

  void removeFromCart2(Fruit fruit){
    Provider.of<FruitShop>(context,listen: false).removeItemFromCart2(fruit);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer2<VegetableShop,FruitShop>(
        builder: (context,value,value2,child) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_rounded),
              iconSize: 28,
              color: Colors.white,
            ),
            title: const Text('Bill',style: TextStyle(color: Colors.white),),
            centerTitle: true,
          ),
          body: Column(
            children: [
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  'Items Summary',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text('Vegetables',style: TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              SizedBox(
                height: 215,
                child:
                  ListView.builder(
                    itemCount: value.userCart.length,
                    itemBuilder: (context,index){
                      Vegetable eachVegetable = value.userCart[index];

                      return VegetableTile(
                          vegetable: eachVegetable,
                          onPressed: () => removeFromCart(eachVegetable),
                          icon: const Icon(Icons.delete),
                      );
                    }
                  ),
              ),
              const Divider(),
              const Text('Fruits', style: TextStyle(fontSize: 18)),
              SizedBox(
                height: 215,
                child: ListView.builder(
                    itemCount: value2.userCart2.length,
                    itemBuilder: (context,index){
                      Fruit eachFruit = value2.userCart2[index];

                      return FruitTile(
                        fruit: eachFruit,
                        onPressed: () => removeFromCart2(eachFruit),
                        icon: const Icon(Icons.delete),
                      );
                    }
                ),
              ),
              const Divider(),
              SizedBox(
                height: 100,
                child: Text(
                    'TOTAL    :     \$ ${(value.calculateTotal()+value2.calculateTotal2()).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    width: 120,
                    child: OutlinedButton(
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                      onPressed: () {
                        Navigator.popUntil(context, ModalRoute.withName('/'));
                        value.emptyCart();
                        value2.emptyCart2();
                        },
                    ),
                  ),
                  const SizedBox(width: 60),
                  SizedBox(
                    height: 60,
                    width: 120,
                    child: ElevatedButton(
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                      onPressed: () {   },
                    ),
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}

