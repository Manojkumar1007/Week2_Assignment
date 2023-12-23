import 'package:basics/models/vegetable_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/fruit_shop.dart';
import 'pages/intro.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => VegetableShop()
        ),
        ChangeNotifierProvider(
            create: (context) => FruitShop()
        )
      ],
      builder:(context,child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
      ),
    );
  }
}
