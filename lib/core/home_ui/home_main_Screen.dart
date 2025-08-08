import 'package:carousel_slider/carousel_slider.dart';
import 'package:elvtrix_ui_task/blocs/cart/cart_bloc.dart';
import 'package:elvtrix_ui_task/blocs/wishlist/wishlist_bloc.dart';
import 'package:elvtrix_ui_task/constans/bottom_navigation_batton.dart';
import 'package:elvtrix_ui_task/core/cart_ui/cartlist_ui.dart';
import 'package:elvtrix_ui_task/core/home_ui/home_component/side_menu_drawer.dart';
import 'package:elvtrix_ui_task/core/repository/auth_firebase_repository.dart';
import 'package:elvtrix_ui_task/core/themes/app_color.dart';
import 'package:elvtrix_ui_task/core/view/home/app_menu/all_categoris/fast_food.dart';
import 'package:elvtrix_ui_task/core/view/home/app_menu/all_categoris/fruit_food.dart';
import 'package:elvtrix_ui_task/core/view/home/app_menu/all_categoris/salad_food.dart';
import 'package:elvtrix_ui_task/core/view/home/choseCategoris.dart';
import 'package:elvtrix_ui_task/core/view/home/trendingCard/trending_card.dart';
import 'package:elvtrix_ui_task/core/wishlist_ui/wishlist_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../product_data_models/product.dart';
import '../view/home/app_menu/all_categoris/all_categoris_food.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  int currentIndex = 0;
  void onTapTapped(int index) {
    if (index == currentIndex) return;
    setState(() {
      currentIndex = index;
    });
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => WishlistUi(),
        ),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_)=> CartListUI(),
          ),
      );
    }
  }

  final List<Product> localImages = [
    Product( image: 'assets/images/slider.jpeg'),
    Product( image: 'assets/images/slider1.jpeg'),
    Product( image: 'assets/images/slider2.jpeg'),
    Product( image: 'assets/images/slider3.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cigar Cafe"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        actions: <Widget>[
          IconButton(onPressed: (){
          }, icon: (Icon(Icons.notifications))),
        ],
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )
        ),
      ),
      drawer: SideMenuDrawer(authRepository: AuthRepository(),),
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
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 130,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 2),
            ),
            itemCount: localImages.length,
            itemBuilder: (context, index, realIndex) {
              return buildLocalImage(localImages[index], index);
            },
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              "Choose From Popular Categories",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AllCategoris()),
                      );
                    },
                    child: ChoseCategoris(
                      name: 'All',
                      imagePath: 'assets/images/all.jpeg',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SaladFood()),
                      );
                    },
                    child: ChoseCategoris(
                      name: 'Salad',
                      imagePath: 'assets/images/salad.jpeg',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FastFood()),
                      );
                    },
                    child: ChoseCategoris(
                      name: 'Fast Food',
                      imagePath: 'assets/images/fast.jpeg',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AllCategoris()),
                      );
                    },
                    child: ChoseCategoris(
                      name: 'Burger',
                      imagePath: 'assets/images/slider.jpeg',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FruitFood()),
                      );
                    },
                    child: ChoseCategoris(
                      name: 'Fruit',
                      imagePath: 'assets/images/fruit.jpeg',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FastFood()),
                      );
                    },
                    child: ChoseCategoris(
                      name: 'Pizza',
                      imagePath: 'assets/images/slider1.jpeg',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              "Trending Picks Just for You",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                TrendingCard(
                  product: Product(

                    image: 'assets/images/all.jpeg',
                    title: "Mix Yummy",
                    category: 'All in One',
                    price: '100',
                  ),
                ),
                TrendingCard(
                  product: Product(

                    image: 'assets/images/salad.jpeg',
                    title: "Salad Vegetarian",
                    category: 'Salad',
                    price: '10',
                  ),
                ),
                TrendingCard(
                  product: Product(

                    image: 'assets/images/fruit.jpeg',
                    title: "Fruit Yummy",
                    category: 'Fruit',
                    price: '20',
                  ),
                ),
                TrendingCard(
                  product: Product(

                    image: 'assets/images/slider.jpeg',
                    title: "Burger",
                    category: 'Fast Food',
                    price: '20',
                  ),
                ),
                TrendingCard(
                  product: Product(

                    image: 'assets/images/slider1.jpeg',
                    title: "Pizza",
                    category: 'Fast Food',
                    price: '300',
                  ),
                ),
                TrendingCard(
                  product: Product(

                    image: 'assets/images/slider2.jpeg',
                    title: "Mix Fruit",
                    category: 'Vageterian',
                    price: '40',
                  ),
                ),
                TrendingCard(
                  product: Product(

                    image: 'assets/images/slider3.jpeg',
                    title: "Fish",
                    category: 'Best',
                    price: '40',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBatton(
        currentIndex: currentIndex,
        onTop: onTapTapped,
      ),
    );
  }

  Widget buildLocalImage(Product product, int index) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: AppColors.lightOrange,
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        product.safeImage,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ),
  );
}
