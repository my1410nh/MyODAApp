import 'package:flutter/material.dart';
import 'package:myodaapp/nav/bottomnavbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),

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
                top: 80, left: 20, right: 20, bottom: 100), 
            child: Column(
              children: [
                const SizedBox(height: 30),
                _buildCardSection(
                  title: "Phân hệ CRM",
                  icon: Icons.tune,
                  items: _CRM,
                ),
                const SizedBox(height: 30),
                _buildCardSection(
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
          // Title row
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
          const SizedBox(height: 30), 

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items.map((item) {
              return Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      item['icon']!,
                      width: 32,
                      height: 32,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['label']!,
                      style: const TextStyle(fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
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
