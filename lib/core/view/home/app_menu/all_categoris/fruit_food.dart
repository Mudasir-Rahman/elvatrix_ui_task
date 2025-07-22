import 'package:flutter/material.dart';
class FruitFood extends StatefulWidget {
  const FruitFood({super.key});

  @override
  State<FruitFood> createState() => _FruitFoodState();
}

class _FruitFoodState extends State<FruitFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fast Food"),
      ),
      body: Column(
        children: [
          Text('Fruit Food'),
        ],
      ),
    );
  }
}
