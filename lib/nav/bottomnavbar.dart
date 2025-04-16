import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import 'custom_drawer.dart'; 

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // GlobalKey to access the Scaffold

  final List<Widget> _screens = const [
    HomeScreen(),
    Center(child: Text('Notifications')),
    Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Attach GlobalKey to Scaffold
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer(); // Open the drawer when menu icon is pressed
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: _screens[_currentIndex],
      drawer: const CustomDrawer(),  // Use CustomDrawer for the navigation menu
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            label: 'Trang chủ',
            icon: ImageIcon(AssetImage('assets/icons/ic_home_border.png'), size: 24),
            activeIcon: ImageIcon(AssetImage('assets/icons/ic_home.png'), size: 24),
          ),
          BottomNavigationBarItem(
            label: 'Thông báo',
            icon: ImageIcon(AssetImage('assets/icons/ic_notifications_border.png'), size: 24),
            activeIcon: ImageIcon(AssetImage('assets/icons/ic_notifications-num.png'), size: 24),
          ),
          BottomNavigationBarItem(
            label: 'Tài khoản',
            icon: ImageIcon(AssetImage('assets/icons/ic_profile_border.png'), size: 24),
            activeIcon: ImageIcon(AssetImage('assets/icons/ic_profile.png'), size: 24),
          ),
        ],
      ),
    );
  }
}
