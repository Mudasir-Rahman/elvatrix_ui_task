import 'package:elvtrix_ui_task/blocs/cart/cart_bloc.dart';
import 'package:elvtrix_ui_task/blocs/cart/cart_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../product_data_models/product.dart';

class CartListTileWidget extends StatelessWidget {
  final Product product;

  const CartListTileWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Image.asset(product.safeImage, width: 60, fit: BoxFit.cover),
        title: Text(product.title ?? 'No Title'),
        subtitle: Text("Price: \$${product.price ?? '0'}"),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            context.read<CartListBloc>().add(RemoveItemFromCart(product: product));
          },
        ),
      ),
    );
  }
}
