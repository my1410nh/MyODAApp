import 'package:flutter/material.dart';
import 'package:myodaapp/view/home_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: Colors.white,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF00C2CB),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            label: 'Main',
            icon: ImageIcon(
              AssetImage('assets/icons/ic_home_border.png'),
              size: 24,
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/icons/ic_home.png'),
              size: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: ImageIcon(
              AssetImage('assets/icons/ic_profile_border.png'),
              size: 24,
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/icons/ic_profile.png'),
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
