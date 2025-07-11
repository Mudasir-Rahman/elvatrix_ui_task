import 'dart:async';

import 'package:elvtrix_ui_task/core/ui_screen/home_screen.dart';
import 'package:flutter/material.dart';
class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5),(){
      Navigator.push(context, MaterialPageRoute(builder: (context )=>HomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/spleshpic.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
      )

    );
  }
}
