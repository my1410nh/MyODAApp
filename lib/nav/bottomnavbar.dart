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
                    ? 'assets/icons/ic_notifications-num.png'
                    : 'assets/icons/ic_notifications_border.png',
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

// import 'package:flutter/material.dart';
// import '../home/home_screen.dart';

// class NavBar extends StatefulWidget {
//   const NavBar({super.key});

//   @override
//   State<NavBar> createState() => _NavBarState();
// }

// class _NavBarState extends State<NavBar> {
//   int _currentIndex = 0;

//   final List<Widget> _screens = const [
//     HomeScreen(),
//     Center(child: Text('Notifications')),
//     Center(child: Text('Profile')),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) => setState(() => _currentIndex = index),
//         items: const [
//           BottomNavigationBarItem(
//             label: 'Trang chủ',
//             icon: ImageIcon(AssetImage('assets/icons/ic_home_border.png'), size: 24),
//             activeIcon: ImageIcon(AssetImage('assets/icons/ic_home.png'), size: 24),
//           ),
//           BottomNavigationBarItem(
//             label: 'Thông báo',
//             icon: ImageIcon(AssetImage('assets/icons/ic_notifications_border.png'), size: 24),
//             activeIcon: ImageIcon(AssetImage('assets/icons/ic_notifications-num.png'), size: 24),
//           ),
//           BottomNavigationBarItem(
//             label: 'Tài khoản',
//             icon: ImageIcon(AssetImage('assets/icons/ic_profile_border.png'), size: 24),
//             activeIcon: ImageIcon(AssetImage('assets/icons/ic_profile.png'), size: 24),
//           ),
//         ],
//       ),
//     );
//   }
// }
