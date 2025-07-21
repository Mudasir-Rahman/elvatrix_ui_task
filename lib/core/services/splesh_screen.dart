import 'package:elvtrix_ui_task/core/services/splesh_serviced.dart';
import 'package:flutter/material.dart';


class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  final SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    splashServices.checkUserLoginStatus(context); // ✅ call here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'We are glad to see you!',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
