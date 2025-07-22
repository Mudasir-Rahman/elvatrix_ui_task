// import 'package:elvtrix_ui_task/core/themes/app_color.dart';
// import 'package:flutter/material.dart';
// class TrendingCard extends StatelessWidget {
//   final String imagePath ;
//   final String title;
//   final int price;
//   const TrendingCard({super.key,required this.imagePath ,required this.title,required this.price});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: AppColors.lightOrange,
//       elevation: 5,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Container(
//
//         width: 150,
//
//         padding: EdgeInsets.all(8),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Image.asset(
//                   imagePath,
//                   height: 150,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               SizedBox(
//                 height: 8,
//               ),
//               Text(title,style: TextStyle(fontSize: 20,color: Colors.red ,),),
//               SizedBox(
//                 height: 3,
//               ),
//               Text('\$price:${price.toString()}',style: TextStyle(fontSize: 20, color: Colors.red,),),
//             TextButton(onPressed: (){
//
//             }, style: TextButton.styleFrom(
//               backgroundColor: AppColors.lightOrange,
//               foregroundColor: Colors.white,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 side: BorderSide(color: Colors.red, width: 2),
//               ),
//             ), child: Text("Order now")),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:elvtrix_ui_task/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class TrendingCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final int price;

  const TrendingCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lightOrange,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: 160,
        height: 250, // 👈 Fixed height added here
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // 👈 Even spacing
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePath,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${price.toString()}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  // Handle order
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.red, width: 1.5),
                  ),
                ),
                child: const Text("Order Now"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
