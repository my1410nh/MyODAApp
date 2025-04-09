import 'package:flutter/material.dart';
import 'dart:async'; 
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splashbg.png'), 
                fit: BoxFit.cover, 
              ),
            ),
          ),
          
          // Logo and Title
          Align(
            alignment: Alignment.topCenter, 
            child: Padding(
              padding: const EdgeInsets.only(top: 250), 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, 
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Logo
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
                  SizedBox(height: 20),

                  // Title
                  Text(
                    'HỆ THỐNG THÔNG TIN',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
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
          
          // Bottom image
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

class SplashScreenWithTimer extends StatefulWidget {
  @override
  _SplashScreenWithTimerState createState() => _SplashScreenWithTimerState();
}

class _SplashScreenWithTimerState extends State<SplashScreenWithTimer> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LogInScreen()), 
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(); 
  }
}
