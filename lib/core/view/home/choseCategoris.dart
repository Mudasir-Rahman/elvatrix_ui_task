// import 'package:flutter/material.dart';
//
// class choseCategoris extends StatelessWidget {
//   final String name;
//  final imagePath;//
//
//
//   const choseCategoris({super.key, required this.name, this.imagePath, });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       width:  80,
//       margin: EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Colors.orange.shade100,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         children: [
//           Image.asset(imagePath,
//           height: 50,
//           width: 90,
//           fit: BoxFit.cover,),
//           SizedBox(
//             height: 5,
//           ),
//           Text(
//             name,
//             style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class ChoseCategoris extends StatelessWidget {
  final String name;
  final String imagePath;

  const ChoseCategoris({
    super.key,
    required this.name,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 105,
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.deepOrange, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.deepOrange.withOpacity(0.15),
            blurRadius: 6,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
