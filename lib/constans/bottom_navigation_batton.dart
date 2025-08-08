import 'package:flutter/material.dart';

class BottomNavigationBatton extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTop;

  const BottomNavigationBatton({
    super.key,
    required this.currentIndex,
    required this.onTop,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTop,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
      ],
    );
  }
}
