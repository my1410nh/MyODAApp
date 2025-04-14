import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding_screen.dart';
import 'login_screen.dart';

class SplashScreenWithTimer extends StatefulWidget {
  const SplashScreenWithTimer({super.key});

  @override
  State<SplashScreenWithTimer> createState() => _SplashScreenWithTimerState();
}

class _SplashScreenWithTimerState extends State<SplashScreenWithTimer> {
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
  }

  Future<void> _navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 2));
    final prefs = await SharedPreferences.getInstance();
    final seen = prefs.getBool('onboarding_complete') ?? false;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => seen ? LogInScreen() : OnboardingScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen(); 
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splashbg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Logo & Text
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 250),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'assets/images/elipse1.png',
                      width: 60.0,
                      height: 60.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'HỆ THỐNG THÔNG TIN',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'QUẢN LÝ TÀI CHÍNH VNPT',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/splashbottom.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
