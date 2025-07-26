import 'package:flutter/material.dart';
import 'package:elvtrix_ui_task/core/product_data_models/product.dart';
import 'package:elvtrix_ui_task/core/themes/app_color.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isFavorite = false; // State to track favorite status

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      backgroundColor: AppColors.vanilla,
      appBar: AppBar(
        title: Text(product.safeTitle),
        backgroundColor: AppColors.lightOrange,
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                product.safeImage,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product.safeTitle,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Category: ${product.safeCategory}",
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              "Price: \$${product.safePrice}",
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            IconButton(onPressed: (){

            }, icon: Icon(Icons.shopping_cart_checkout_outlined)),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle "Add to cart" or "Order"
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              ),
              child: const Text("Order Now"),
            ),
          ],
        ),
      ),
    );
  }
}
