import 'package:elvtrix_ui_task/blocs/wishlist/wishlist_bloc.dart';
import 'package:elvtrix_ui_task/blocs/wishlist/wishlist_event.dart';
import 'package:elvtrix_ui_task/blocs/wishlist/wishlist_state.dart';
import 'package:elvtrix_ui_task/core/detail_product/detail_of_product.dart';
import 'package:elvtrix_ui_task/core/product_data_models/product.dart';
import 'package:flutter/material.dart';
import 'package:elvtrix_ui_task/core/themes/app_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TrendingCard extends StatefulWidget {
final  Product product;
   TrendingCard({

    super.key,
    required this.product,
  });

  @override
  State<TrendingCard> createState() => _TrendingCardState();
}

class _TrendingCardState extends State<TrendingCard> {
bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailScreen(product: widget.product,)));
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
                  widget.product.safeImage,
                  width: double.infinity,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.product.safeTitle,
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
                   icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,color: Colors.red,),
                   onPressed: () {
                     if (isFavorite) {

                       context.read<WishListBloc>().add(RemoveFromWishList(product:Product()));
                     } else {
                       Colors.white;
                       context.read<WishListBloc>().add(AddToWishListEvent(product: Product()));
                     }
                   },
                 ),
             SizedBox(width: 5,),
                 IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart)),

               ]
             ),
            ],
          ),
        ),
      ),
    );
  }
}
