import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myodaapp/nav/bottomnavbar.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Splash Screen Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SplashScreenWithTimer(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenWithTimer(),
    );
  }
}
