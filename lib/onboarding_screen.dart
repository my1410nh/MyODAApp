import 'package:flutter/material.dart';
import 'package:myodaapp/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> data = [
    {
      'image': 'assets/onboard1.png',
      'title': 'Dễ dàng đổi các ưu đãi, quà tặng',
      'desc': 'Lorem ipsum is a dummy text without any sense. It is a sequence of Latin words that, as they are positioned',
    },
    {
      'image': 'assets/onboard2.png',
      'title': 'Xem thông tin Hội viên',
      'desc': 'Lorem ipsum is a dummy text without any sense. It is a sequence of Latin words that, as they are positioned',
    },
    {
      'image': 'assets/onboard3.png',
      'title': 'Tận hưởng các ưu đãi đặc quyền',
      'desc': 'Lorem ipsum is a dummy text without any sense. It is a sequence of Latin words that, as they are positioned',
    },
  ];

  void _finishOnboarding() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('onboarding_complete', true);

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => LogInScreen()),
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: data.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (context, index) {
                final item = data[index];
                return Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(item['image']!, height: 260),
                      SizedBox(height: 30),
                      Text(
                        item['title']!,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12),
                      Text(
                        item['desc']!,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(data.length, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.blue : Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: _finishOnboarding,
                  child: Text('Bỏ qua', style: TextStyle(color: Colors.blue)),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage == data.length - 1) {
                      _finishOnboarding();
                    } else {
                      _controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text('Tiếp'),
                ),
              ],
            ),

          )
        ],
      ),
    );
  }
}
