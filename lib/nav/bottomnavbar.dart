import 'package:flutter/material.dart';
import 'package:myodaapp/home/home_screen.dart';
import 'package:myodaapp/home/nofitications_screen.dart';
import 'package:myodaapp/home/profile_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}): super(key: key);

  @override 
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar>{
  int _currentIndex = 0;
  List<Widget> body = const [
    HomeScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  @override 
  Widget build(BuildContext context) {
    print("hello");
    return Scaffold(
      body: Center(
        child: body[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Trang chủ',
            icon: ImageIcon(
              AssetImage(
                _currentIndex == 0
                    ? 'assets/icons/ic_home.png'
                    : 'assets/icons/ic_home_border.png',
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Thông báo',
            icon: ImageIcon(
              AssetImage(
                _currentIndex == 1
                    ? 'assets/icons/ic_notification.png'
                    : 'assets/icons/ic_notification_border.png',
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Tài khoản',
            icon: ImageIcon(
              AssetImage(
                _currentIndex == 2
                    ? 'assets/icons/ic_profile.png'
                    : 'assets/icons/ic_profile_border.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}