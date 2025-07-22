import 'package:flutter/material.dart';
class SaladFood extends StatefulWidget {
  const SaladFood({super.key});

  @override
  State<SaladFood> createState() => _SaladFoodState();
}

class _SaladFoodState extends State<SaladFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Salad Food"),
      ),
      body: Column(
        children: [
          Text("Welcome To Salad Food "),
        ],
      ),
    );
  }
}
