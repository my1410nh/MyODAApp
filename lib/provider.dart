import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodel/login_viewmodel.dart';
import 'viewmodel/events_viewmodel.dart';
import 'view/auth/login_screen.dart';
import 'view/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => EventsViewModel()),
      ],
      child: MaterialApp(
        title: 'ODA Management App',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/login',
        routes: {
          '/login': (context) => LogInScreen(),
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
