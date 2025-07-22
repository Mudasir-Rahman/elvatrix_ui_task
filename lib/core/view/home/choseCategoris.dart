import 'package:flutter/material.dart';

class choseCategoris extends StatelessWidget {
  final String name;
 final imagePath;//


  const choseCategoris({super.key, required this.name, this.imagePath, });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width:  80,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.orange.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Image.asset(imagePath,
          height: 50,
          width: 90,
          fit: BoxFit.cover,),
          SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
          )
        ],
      ),
    );
  }
}
