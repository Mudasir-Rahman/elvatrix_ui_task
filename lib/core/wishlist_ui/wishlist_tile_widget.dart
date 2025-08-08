import 'package:elvtrix_ui_task/core/view/home/trendingCard/trending_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/wishlist/wishlist_bloc.dart';
import '../../blocs/wishlist/wishlist_event.dart';
import '../product_data_models/product.dart';

class WishlistTileWidget extends StatelessWidget {
  final Product product;

  const WishlistTileWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return TrendingCard(
      product: Product(
        image: product.safeImage,
        title: product.title,
        price: product.price,
        category: product.category,
      ),
    );
  }
}
