import 'package:elvtrix_ui_task/blocs/auth/auth_login/auth_login_bloc.dart';
import 'package:elvtrix_ui_task/blocs/auth/auth_login/auth_login_event.dart';
import 'package:elvtrix_ui_task/blocs/auth/auth_login/auth_login_state.dart';
import 'package:elvtrix_ui_task/core/themes/app_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../home_ui/home_main_Screen.dart';
import 'signUp_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController =TextEditingController();
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
       BlocListener<AuthBloc, AuthState>(
  listener: (context, state) {
    if(state is AuthLoadingState){
      showDialog(context: context,
          barrierDismissible: false,
          builder: (_)=>const Center(child:  CircularProgressIndicator(),));
    }else if(state is AuthSuccessState){
Navigator.pop(context);
ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login Successful "),));
Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeMainScreen()));
    }else if (state is AuthFailureState) {
      Navigator.pop(context); // Close loading dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
    }
  },
  child: Form(
         key: formKey,
         child: Padding(
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
    validator: (value){
    if(value==null || value.isEmpty){
    return "Email is required ";
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {

      return 'Please enter a valid email';

    }},
                  controller: emailController,
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
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return "Password is required ";
                    }
                    if(value.length<6){
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  controller:  passwordController,
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
                SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(

                        backgroundColor: AppColors.lightOrange,
                        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(30)),
                      ),
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          BlocProvider.of<AuthBloc>(context).add(
                            LoginRequested(
                                emailController.text.trim(),

                                passwordController.text.trim()),
                          );
                        }
                      },
                      child: Text("Login",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black),)),
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
       ),
),
    );
  }
}
