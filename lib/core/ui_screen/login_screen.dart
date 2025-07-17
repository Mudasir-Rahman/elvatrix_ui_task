import 'package:elvtrix_ui_task/core/themes/app_color.dart';
import 'package:elvtrix_ui_task/core/ui_screen/signUp_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.vanilla,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Login ',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.lightOrange,
      ),
      body:
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: SingleChildScrollView(child:   Column(
            children: [
              const SizedBox(height: 10),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: const Image(
                  image: AssetImage('assets/images/loginscreen.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  labelText: "Email",
                  prefixIcon: const Icon(Icons.email_outlined),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: const Icon(Icons.visibility),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                      children: [
                        const TextSpan(text: 'Need have an account?  '),
                        TextSpan(
                          text: 'SignUp',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              )

            ],
          ),
         ),
       ),
    );
  }
}
