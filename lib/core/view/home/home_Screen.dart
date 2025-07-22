import 'package:carousel_slider/carousel_slider.dart';
import 'package:elvtrix_ui_task/core/themes/app_color.dart';
import 'package:elvtrix_ui_task/core/view/home/app_menu/all_categoris/fast_food.dart';
import 'package:elvtrix_ui_task/core/view/home/app_menu/all_categoris/fruit_food.dart';
import 'package:elvtrix_ui_task/core/view/home/app_menu/all_categoris/salad_food.dart';

import 'package:elvtrix_ui_task/core/view/home/choseCategoris.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';

import 'app_menu/all_categoris/all_categoris_food.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> urlImages = [
    // Burger
    'https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246_960_720.jpg',
    'https://images.unsplash.com/photo-1606756794531-0c1c86ec1b6b?w=800&h=600&auto=format',

    // Pizza
    'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg',
    'https://images.unsplash.com/photo-1601924582971-3c30f32f7c4f?w=800&h=600&auto=format',

    // Fries
    'https://cdn.pixabay.com/photo/2016/03/05/19/02/french-fries-1238247_960_720.jpg',
    'https://images.unsplash.com/photo-1571091718767-18b5b1457add?w=800&h=600&auto=format',

    // Chicken
    'https://cdn.pixabay.com/photo/2017/01/31/20/23/chicken-2026412_960_720.jpg',
    'https://images.unsplash.com/photo-1589308078054-83261e2f63f3?w=800&h=600&auto=format',

    // Salad
    'https://images.unsplash.com/photo-1556912994-2cd90f1a1af7?w=800&h=600&auto=format',
    'https://cdn.pixabay.com/photo/2015/04/08/13/13/food-712665_960_720.jpg',
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
              height: 300,
              reverse: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 2),
            ),
            itemCount: urlImages.length,
            itemBuilder: (context, index, realIndex) {
              final urImages = urlImages[index];
              return buildImage(urImages, index);
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
                onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>AllCategoris()));
    },
                  child:choseCategoris(name: 'All',
                    imagePath: 'assets/images/all.jpeg',),
    ),
              SizedBox(width: 3),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SaladFood()));
                },
                child:choseCategoris(name: 'Salad',
                  imagePath: 'assets/images/salad.jpeg',),
              ),
              SizedBox(width: 3),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FastFood()));
                },
                child:choseCategoris(name: 'Fast Food',
                  imagePath: 'assets/images/fast.jpeg',),
              ),
              SizedBox(width: 3),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FruitFood()));
                },
                child:choseCategoris(name: 'Fruit',
                  imagePath: 'assets/images/fruit.jpeg',),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text("Trend For You",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),

        ],
      ),
    );
  }

  Widget buildImage(String urImages, int index) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 12),
    color: AppColors.lightOrange,
    child: Image.network(
      urImages,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 50),
    ),
  );
}
