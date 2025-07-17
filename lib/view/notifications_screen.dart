import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  static const List<Map<String, String>> _notifications = [
    {
      'title': 'Cập nhật chính sách công ty',
      'subtitle': 'Vui lòng xem bản cập nhật mới nhất về quy định công ty.',
      'date': '15/07/2025'
    },
    {
      'title': 'Thời hạn đăng ký nghỉ lễ',
      'subtitle': 'Hạn chót đăng ký nghỉ lễ 30/4 - 1/5 là ngày 20/04.',
      'date': '13/07/2025'
    },
    {
      'title': 'Đào tạo kỹ năng mềm',
      'subtitle': 'Khóa học kỹ năng mềm bắt đầu vào tuần tới.',
      'date': '10/07/2025'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom AppBar-like Row
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Thông báo',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Notifications list
              Expanded(
                child: ListView.separated(
                  itemCount: _notifications.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (_, index) {
                    final item = _notifications[index];
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'] ?? '',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item['subtitle'] ?? '',
                            style: const TextStyle(
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['date'] ?? '',
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
