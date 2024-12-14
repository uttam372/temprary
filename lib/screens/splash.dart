// File: lib/splash_screen.dart
import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          child: Image.asset('assets/splash_image.png', // Replace with your image
              width: 200, height: 200),
        ),
      ),
    );
  }
}
