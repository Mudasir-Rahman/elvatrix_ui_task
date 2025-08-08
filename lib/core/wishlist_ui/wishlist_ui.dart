import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/wishlist/wishlist_bloc.dart';
import '../../blocs/wishlist/wishlist_state.dart';
import '../../constans/bottom_navigation_batton.dart';
import '../cart_ui/cartlist_ui.dart';
import 'wishlist_tile_widget.dart';
import '../home_ui/home_main_Screen.dart';

class WishlistUi extends StatefulWidget {
  const WishlistUi({super.key});

  @override
  State<WishlistUi> createState() => _WishlistUiState();
}

class _WishlistUiState extends State<WishlistUi> {
  int currentIndex = 1;

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
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const CartListUI()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
        backgroundColor: Colors.red,
      ),
      body: BlocBuilder<WishListBloc, WishListState>(
        builder: (context, state) {
          if (state is WishListSuccessState) {
            if (state.wishListItems.isEmpty) {
              return const Center(child: Text("No items in Wishlist"));
            }
            return ListView.builder(
              itemCount: state.wishListItems.length,
              itemBuilder: (context, index) {
                return WishlistTileWidget(product: state.wishListItems[index]);
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
