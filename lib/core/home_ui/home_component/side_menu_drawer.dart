import 'package:elvtrix_ui_task/core/cart_ui/cartlist_ui.dart';
import 'package:elvtrix_ui_task/core/home_ui/home_main_Screen.dart';
import 'package:elvtrix_ui_task/core/view/sign_login_screen/welcome_screen.dart';
import 'package:elvtrix_ui_task/core/wishlist_ui/wishlist_ui.dart';
import 'package:flutter/material.dart';

import '../../repository/auth_firebase_repository.dart';
class SideMenuDrawer extends StatelessWidget {
  final    AuthRepository authRepository;
  const SideMenuDrawer({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:  ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(decoration: BoxDecoration(
            color: Colors.orangeAccent
          ),
          child: Text("Menu", style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeMainScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("favorite"),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>WishlistUi()));
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Cart'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartListUI()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () async {
              Navigator.pop(context); // Close the drawer
              await authRepository.signOut(); // 👈 Perform actual logout

              // Then navigate to WelcomeScreen or LoginScreen
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => WelcomeScreen()),
                    (route) => false, // Clear all previous routes from the stack
              );
            },
          ),

        ],
      ),
    );
  }
}
