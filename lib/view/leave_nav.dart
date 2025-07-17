import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myodaapp/view/home_screen.dart';
import 'package:myodaapp/view/apply_leave_screen.dart';
import 'package:myodaapp/view/leave_status_screen.dart';
import 'package:myodaapp/model/leave_form_controller.dart';

class LeaveNav extends StatefulWidget {
  const LeaveNav({super.key});

  @override
  State<LeaveNav> createState() => _LeaveNavState();
}

class _LeaveNavState extends State<LeaveNav> {
  int _currentIndex = 1;

  final List<Widget> _screens = [
    ChangeNotifierProvider(
      create: (_) => LeaveFormController(),
      child: const ApplyLeaveScreen(),
    ),
    const LeaveStatusScreen(),
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            activeIcon: Icon(Icons.add_circle),
            label: 'Apply Leave',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            activeIcon: Icon(Icons.fact_check),
            label: 'Leave Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
        selectedItemColor: Color(0xFF00C2CB),
        unselectedItemColor: Colors.black87,
      ),
    );
  }
}
