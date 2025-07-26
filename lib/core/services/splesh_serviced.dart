import 'dart:async';
import 'package:elvtrix_ui_task/core/services/splesh_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home_ui/home_main_Screen.dart';
import '../view/sign_login_screen/welcome_screen.dart';


class SplashServices {
  void checkUserLoginStatus(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // User is logged in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeMainScreen()),
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
