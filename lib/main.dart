import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'view/common/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('onboarding_complete');
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
      home: SplashScreenWithTimer(),
      debugShowCheckedModeBanner: false,
    );
  }
}
