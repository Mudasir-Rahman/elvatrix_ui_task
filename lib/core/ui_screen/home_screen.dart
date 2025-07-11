import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void showLoginSignupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.amber[100],
        title: const Text('Choose Action'),
        content: const Text('Please select Login or Sign Up to continue.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pushNamed(context, '/login'); // Navigate to login screen
            },
            child: const Text("Login"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pushNamed(context, '/signup'); // Navigate to signup screen
            },
            child: const Text("Sign Up"),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFEFE5C1),

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
                    height: 80,
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
                  Container(
                    height: 80,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Color(0xffe9b860),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Text("Already have account",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
                  )
                ],
              ),
            ))
          ],
        )
    );
  }
}
// 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