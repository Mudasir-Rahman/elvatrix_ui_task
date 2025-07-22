import 'package:flutter/material.dart';
class AllCategoris extends StatefulWidget {
  const AllCategoris({super.key});

  @override
  State<AllCategoris> createState() => _AllCategorisState();
}

class _AllCategorisState extends State<AllCategoris> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome To All Food'),
      ),
      body: Center(
        child: Text('Welcome'),
      ),
    );
  }
}
