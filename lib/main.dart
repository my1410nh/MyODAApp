import 'package:flutter/material.dart';
import 'splash_screen.dart';  // Import the splash screen with timer

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreenWithTimer(),  // Start with SplashScreenWithTimer
    );
  }
}
