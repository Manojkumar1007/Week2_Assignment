import 'package:flutter/material.dart';

import 'vegetables_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              height: 400,
              child: Image.asset('assets/vegetables.jpg'),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return const VegetablePage();
              }
              )),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.all(24),
                child: const Text(
                  'Start Shopping',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}

