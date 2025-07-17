import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'view/splash_screen.dart';
import 'viewmodel/login_viewmodel.dart';
import 'model/leave_form_controller.dart'; // ✅ Add this import

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('onboarding_complete');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => LeaveFormController()), // ✅ Add this line
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
      title: 'VNPT App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        textTheme: ThemeData.light().textTheme.apply(
              fontFamily: 'Poppins',
            ),
      ),
      home: const SplashScreenWithTimer(),
      debugShowCheckedModeBanner: false,
    );
  }
}
