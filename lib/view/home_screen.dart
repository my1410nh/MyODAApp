import 'package:flutter/material.dart';
import 'detail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 240,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_home.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(
                top: 80, left: 20, right: 20, bottom: 20),
            child: Column(
              children: [
                const SizedBox(height: 30),
                _buildCardSection(
                  context: context,
                  title: "Phân hệ CRM",
                  icon: Icons.tune,
                  items: _CRM,
                ),
                const SizedBox(height: 20),
                _buildCardSection(
                  context: context,
                  title: "Phân hệ COM",
                  icon: Icons.grid_view,
                  items: _COM,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardSection({
    required BuildContext context,
    required String title,
    required IconData icon,
    required List<Map<String, String>> items,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Icon(icon, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 8),
          GridView.count(
            padding: EdgeInsets.zero,
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 12,
            childAspectRatio: 1.1,
            children: items.map((item) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EventDetail(
                        title: item['label']!,
                        events: _mockEvents,
                      ),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      item['icon']!,
                      width: 36,
                      height: 36,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 8),
                    Flexible(
                      child: Text(
                        item['label']!,
                        style: const TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

final List<Map<String, String>> _CRM = [
  {"icon": "assets/icons/ic_users.png", "label": "Party Management"},
  {"icon": "assets/icons/ic_headphone.png", "label": "Customer Management"},
  {"icon": "assets/icons/ic_search_file.png", "label": "Sale Management"},
];

final List<Map<String, String>> _COM = [
  {"icon": "assets/icons/ic_data_storage.png", "label": "Product Order"},
  {"icon": "assets/icons/ic_layer.png", "label": "Work Order"},
  {"icon": "assets/icons/ic_basket.png", "label": "Shopping Cart"},
];

final List<Map<String, String>> _mockEvents = [
  {'title': 'Danh bạ nhân sự', 'subtitle': 'Danh bạ nhân sự'},
  {'title': 'Đăng ký nghỉ', 'subtitle': 'Đăng ký nghỉ'},
  {'title': 'Phê duyệt đăng ký nghỉ', 'subtitle': 'Phê duyệt đăng ký nghỉ'},
  {'title': 'Hồ sơ cá nhân tự khai', 'subtitle': 'Hồ sơ cá nhân tự khai'},
  {'title': 'Thu nhập cá nhân', 'subtitle': 'Thu nhập cá nhân'},
];
