import 'package:elvtrix_ui_task/blocs/wishlist/wishlist_bloc.dart';
import 'package:elvtrix_ui_task/blocs/wishlist/wishlist_event.dart';
import 'package:elvtrix_ui_task/core/product_data_models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class WishlistTileWidget extends StatefulWidget {
  final Product product;
  const WishlistTileWidget({super.key ,required this.product});


  @override
  State<WishlistTileWidget> createState() => _WishlistTileWidgetState();
}

class _WishlistTileWidgetState extends State<WishlistTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(widget.product.safeImage),
        title: Text(widget.product.safeTitle),
        subtitle: Text(widget.product.safePrice),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            context.read<WishListBloc>().add(RemoveFromWishList(product: widget.product));
          },
        ),
      ),
    );
  }
}

