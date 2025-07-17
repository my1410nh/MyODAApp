import 'package:flutter/material.dart';
import 'package:myodaapp/view/detail.dart';
import 'package:myodaapp/view/notifications_screen.dart';
import 'package:myodaapp/view/leave_status_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Map<String, dynamic>> _dashboardItems = [
    {"icon": Icons.access_time, "label": "Attendance"},
    {"icon": Icons.beach_access, "label": "Leave"},
    {"icon": Icons.task, "label": "My Task"},
    {"icon": Icons.receipt_long, "label": "Payslip"},
    {"icon": Icons.person_outline, "label": "Profile"},
  ];

  static const List<Map<String, String>> _unfinishedTasks = [
    {'code': 'ERP', 'date': '01/01/2023'},
    {'code': 'ROM', 'date': '01/01/2023'},
  ];

  static const List<Map<String, String>> _mockEvents = [
    {'title': 'Default Event 1', 'subtitle': 'Description 1'},
    {'title': 'Default Event 2', 'subtitle': 'Description 2'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.cover,
              height: 250,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Home',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.notifications_none, 
                                color: Colors.white),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const NotificationScreen(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 16),
                          const Icon(Icons.settings, color: Colors.white),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 40, color: Color(0xFF00C2CB)),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Center(
                    child: Text(
                      'Welcome back,\nJohn Doe',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'Dashboard',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
                    ),
                    padding: const EdgeInsets.all(20),
                    child: GridView.count(
                      crossAxisCount: 3, // Required parameter added
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1,
                      children: _dashboardItems.map((item) {
                        return GestureDetector(
                          onTap: () {
                            if (item['label'] == 'Leave') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const LeaveStatusScreen(),
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => EventDetail(
                                    title: item['label']!,
                                    events: _mockEvents,
                                  ),
                                ),
                              );
                            }
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF0FAFA),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  item['icon'] as IconData,
                                  size: 28,
                                  color: const Color(0xFF00C2CB),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Flexible(
                                child: Text(
                                  item['label']!,
                                  style: const TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Unfinished Tasks',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
                      ),
                      Text(
                        'Full List →',
                        style: TextStyle(fontSize: 13, color: Color(0xFF00C2CB), fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 90,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _unfinishedTasks.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (_, index) {
                        final task = _unfinishedTasks[index];
                        return Container(
                          width: 140,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.blue.shade100,
                                    child: const Icon(Icons.event, size: 14, color: Colors.blue),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    task['code']!,
                                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                task['date']!,
                                style: const TextStyle(fontSize: 11, fontFamily: 'Poppins'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'HR\'s Announcement & News',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF0C2D48),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      title: const Text(
                        'Training',
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: Colors.white),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white),
                      onTap: () {
                        // Handle HR news tap
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}