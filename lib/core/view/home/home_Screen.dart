import 'package:carousel_slider/carousel_slider.dart';
import 'package:elvtrix_ui_task/core/products/product.dart';
import 'package:elvtrix_ui_task/core/themes/app_color.dart';
import 'package:elvtrix_ui_task/core/view/home/app_menu/all_categoris/fast_food.dart';
import 'package:elvtrix_ui_task/core/view/home/app_menu/all_categoris/fruit_food.dart';
import 'package:elvtrix_ui_task/core/view/home/app_menu/all_categoris/salad_food.dart';

import 'package:elvtrix_ui_task/core/view/home/choseCategoris.dart';
import 'package:elvtrix_ui_task/core/view/home/trendingCard/trending_card.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';

import 'app_menu/all_categoris/all_categoris_food.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final  List<Product> localImages = [
    Product(image: 'assets/images/slider.jpeg',),
    Product(image: 'assets/images/slider1.jpeg',),
    Product(image: 'assets/images/slider2.jpeg',),
    Product(image: 'assets/images/slider3.jpeg',),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.vanilla,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: 40),
          Container(
            width: double.infinity,
            color: AppColors.lightOrange,
            padding: const EdgeInsets.all(16),
            child: const Text(
              "Special Offers",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          CarouselSlider.builder(
              options: CarouselOptions(
                height: 150,
               // reverse: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
              ),
              itemCount: localImages.length,
            itemBuilder: (context, index, realIndex) {
              return buildLocalImage(localImages[index], index);
            },

          ),
          const SizedBox(height: 10),
          const Text(
            "Chose Your Favorite Categories",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AllCategoris()));
                },
                child: choseCategoris(name: 'All',
                  imagePath: 'assets/images/all.jpeg',),
              ),
              SizedBox(width: 3),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SaladFood()));
                },
                child: choseCategoris(name: 'Salad',
                  imagePath: 'assets/images/salad.jpeg',),
              ),
              SizedBox(width: 3),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FastFood()));
                },
                child: choseCategoris(name: 'Fast Food',
                  imagePath: 'assets/images/fast.jpeg',),
              ),
              SizedBox(width: 3),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FruitFood()));
                },
                child: choseCategoris(name: 'Fruit',
                  imagePath: 'assets/images/fruit.jpeg',),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text("Trend For You",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.red),),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            physics: NeverScrollableScrollPhysics(),
            children: const [
              TrendingCard(imagePath: 'assets/images/all.jpeg', title: "Mix Yummy", price: 200),
              TrendingCard(imagePath: 'assets/images/fruit.jpeg', title: "Fruit Bowl", price: 150),
              // TrendingCard(imagePath: 'assets/images/all.jpeg', title: "Mix Yummy", price: 200),
              // TrendingCard(imagePath: 'assets/images/fruit.jpeg', title: "Fruit Bowl", price: 150),

            ],
          ),

          // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Row(
        //     children: [
        //       TrendingCard(imagePath: 'assets/images/all.jpeg', title: "Mix Yummy",price: 200,)
        //     ],
        //   ),
       // )
        ],
      ),
    );
  }

  Widget buildLocalImage(Product product, int index) =>
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.lightOrange,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            product.image,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      );

}