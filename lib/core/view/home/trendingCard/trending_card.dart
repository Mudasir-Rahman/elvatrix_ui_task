
import 'package:elvtrix_ui_task/blocs/cart/cart_bloc.dart';
import 'package:elvtrix_ui_task/blocs/cart/cart_event.dart';
import 'package:elvtrix_ui_task/blocs/cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../blocs/wishlist/wishlist_bloc.dart';
import '../../../../blocs/wishlist/wishlist_event.dart';
import '../../../../blocs/wishlist/wishlist_state.dart'
    show WishListState, WishListSuccessState;
import '../../../detail_product/detail_of_product.dart';
import '../../../product_data_models/product.dart' show Product;
import '../../../themes/app_color.dart';

class TrendingCard extends StatelessWidget {
  final Product product;

  const TrendingCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListBloc, WishListState>(
      builder: (context, state) {
        final isFavorite =
            state is WishListSuccessState &&
            state.wishListItems.contains(product);
        return BlocBuilder<CartListBloc, CartState>(
          builder: (context, cartState) {
            final isCarted =
                cartState is CartSuccessState &&
                cartState.cartedItem.contains(product);

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: product),
                  ),
                );
              },
              child: Card(
                elevation: 6,
                color: AppColors.lightOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          product.safeImage,
                          width: double.infinity,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product.safeTitle,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.red,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              if (isFavorite) {
                                context.read<WishListBloc>().add(
                                  RemoveFromWishList(product: product),
                                );
                              } else {
                                context.read<WishListBloc>().add(
                                  AddToWishListEvent(product: product),
                                );
                              }
                            },
                          ),
                          const SizedBox(width: 5),
                          IconButton(
                            icon: Icon(
                              isCarted
                                  ? Icons.shopping_cart
                                  : Icons.add_shopping_cart,
                              color: isCarted ? Colors.green : Colors.grey,
                            ),
                            onPressed: () {
                              if (!isCarted) {
                                context.read<CartListBloc>().add(
                                  AddItemsToCart(product: product),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
