import 'package:basics/components/fruit_tile.dart';
import 'package:basics/models/fruit_shop.dart';
import 'package:basics/models/vegetable_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/fruit.dart';
import 'cart_page.dart';

class FruitPage extends StatefulWidget {
  const FruitPage({super.key});

  @override
  State<FruitPage> createState() => _FruitPageState();
}

class _FruitPageState extends State<FruitPage> {

  void addToCart2(Fruit fruit){
    Provider.of<FruitShop>(context,listen: false).addItemToCart2(fruit);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer2<VegetableShop,FruitShop>(
      builder: (context,value,value2,child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          title: const Text(
            'Choose Fruits',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_rounded),
            iconSize: 28,
            color: Colors.white,
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 40),
            SizedBox(
              height: 500,
              child: ListView.builder(
                  itemCount: value2.fruitShop.length,
                  itemBuilder: (context,index){
                    //get individual fruit
                    Fruit eachFruit = value2.fruitShop[index];

                    //return the tile for this vegetable
                    return FruitTile(
                        fruit: eachFruit,
                        onPressed: () => addToCart2(eachFruit),
                        icon: const Icon(Icons.add)
                    );
                  }),
            ),
            const SizedBox(height: 40),
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
                    onPressed: () { Navigator.pop(context); value.emptyCart();},
                  ),
                ),
                const SizedBox(width: 60),
                SizedBox(
                  height: 60,
                  width: 120,
                  child: ElevatedButton(
                    child: const Text(
                      'Next',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        return const CartPage();
                      },
                    )),
                  ),
                ),
              ],
            )
          ],
        ),

      ),
    );
  }
}
