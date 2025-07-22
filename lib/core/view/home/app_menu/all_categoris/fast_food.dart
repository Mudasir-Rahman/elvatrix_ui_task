import 'package:flutter/material.dart';
class FastFood extends StatefulWidget {
  const FastFood({super.key});

  @override
  State<FastFood> createState() => _FastFoodState();
}

class _FastFoodState extends State<FastFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fast Food"),
      ),
      body: Column(
        children: [
          Text("Welcome To Fast Food "),
          Card(
            child: Image.asset('assets/images/fast.jpeg' ),
          )
        ],
      ),
    );
  }
}
