import 'dart:async';
import 'package:elvtrix_ui_task/core/services/splesh_screen.dart';
import 'package:elvtrix_ui_task/core/view/home/home_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../view/ui_screen/welcome_screen.dart';

class SplashServices {
  void checkUserLoginStatus(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // User is logged in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      } else {
        // User not logged in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const WelcomeScreen()),
        );
      }
    });
  }
}
