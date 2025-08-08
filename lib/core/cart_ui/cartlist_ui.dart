import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elvtrix_ui_task/blocs/cart/cart_bloc.dart';
import 'package:elvtrix_ui_task/blocs/cart/cart_state.dart';
import 'package:elvtrix_ui_task/constans/bottom_navigation_batton.dart';
import 'package:elvtrix_ui_task/core/cart_ui/cart_tile_list_ui.dart';
import 'package:elvtrix_ui_task/core/home_ui/home_main_Screen.dart';

import '../wishlist_ui/wishlist_ui.dart';

class CartListUI extends StatefulWidget {
  const CartListUI({super.key});

  @override
  State<CartListUI> createState() => _CartListUIState();
}

class _CartListUIState extends State<CartListUI> {
  int currentIndex = 2;

  void onTapTapped(int index) {
    if (index == currentIndex) return;

    setState(() {
      currentIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeMainScreen()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const WishlistUi()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart'), backgroundColor: Colors.red),
      body: BlocBuilder<CartListBloc, CartState>(
        builder: (context, state) {
          if (state is CartSuccessState) {
            if (state.cartedItem.isEmpty) {
              return const Center(child: Text("No Items in Cart"));
            }
            return ListView.builder(
              itemCount: state.cartedItem.length,
              itemBuilder: (context, index) {
                return CartListTileWidget(product: state.cartedItem[index]);
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: BottomNavigationBatton(
        currentIndex: currentIndex,
        onTop: onTapTapped,
      ),
    );
  }
}
