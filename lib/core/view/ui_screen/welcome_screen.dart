import 'package:elvtrix_ui_task/core/themes/app_color.dart';
import 'package:elvtrix_ui_task/core/view/ui_screen/signUp_screen.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  void showLoginSignupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.lightOrange,
        title: const Text('Choose Action'),
        content: const Text('Please select Login or Sign Up to continue.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              // Navigator.pushNamed(context, '/login'); //
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
            },
            child: const Text("Login",style:  TextStyle(fontSize: 22),),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
            },
            child: const Text("Sign Up",style:  TextStyle(fontSize: 22),),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.vanilla,
        appBar: AppBar(
          title: Text("Welcome"),
        ),

        body: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Center(
              child: Image.asset('assets/images/home_screen2.jpeg',
                height: 400,
                fit:BoxFit.contain,
              ),
            ),
            Expanded(child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(90)),
              ),
              child: Column(

                children: [
                  ListTile(
                    title: Text('Yummy Food Waiting You',textAlign: TextAlign.center, style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                    subtitle: Text("Any order here is very perfect for you and me ,we're to serve you and we fall in love to cook for you ",textAlign: TextAlign.center,),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                GestureDetector(
                  onTap: (){

                   showLoginSignupDialog(context);
                  },
                  child: Container(
                    height: 60,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Color(0xffe9b860),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Text("Login or SignUp",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
                  ),
                ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },
                    child: Container(
                      height: 60,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Color(0xffe9b860),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(child: Text("Already have account",style: TextStyle(fontSize: 22,
                          fontWeight: FontWeight.bold,color: Colors.black),)),
                    ),
                  ),
                ],
              ),
            ))
          ],
        )
    );
  }
}
// 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