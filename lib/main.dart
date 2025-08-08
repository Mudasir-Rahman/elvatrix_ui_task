import 'package:elvtrix_ui_task/blocs/auth/auth_login/auth_login_bloc.dart';
import 'package:elvtrix_ui_task/blocs/auth/auth_signup/auth_signup_bloc.dart';
import 'package:elvtrix_ui_task/blocs/cart/cart_bloc.dart';
import 'package:elvtrix_ui_task/blocs/wishlist/wishlist_bloc.dart';
import 'package:elvtrix_ui_task/core/cart_ui/cartlist_ui.dart';
import 'package:elvtrix_ui_task/core/repository/auth_firebase_repository.dart';
import 'package:elvtrix_ui_task/core/services/splesh_screen.dart';
import 'package:elvtrix_ui_task/core/wishlist_ui/wishlist_ui.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Create instance of your AuthRepository
  final authRepository = AuthRepository();

  // Run the app with BlocProvider
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(authRepository: authRepository),
        ),

        BlocProvider<AuthSignupBloc>(
          create: (_) => AuthSignupBloc(authRepository: authRepository),
        ),
        BlocProvider(create: (_) => WishListBloc()),
        BlocProvider(create: (_) => CartListBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elvtrix Login App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SpleshScreen(),
    );
  }
}
