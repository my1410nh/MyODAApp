import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: [
              Color.fromRGBO(0, 163, 255, 1),
              Color.fromRGBO(0, 51, 231, 1)
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Colors.blue,
                      size: 40,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Name',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'ID',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Mail',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: const [
                  _DrawerItem(icon: Icons.home, label: 'Trang chủ'),
                  _DrawerItem(icon: Icons.notifications, label: 'Thông báo'),
                  _DrawerItem(icon: Icons.payment, label: 'Thanh toán'),
                  _DrawerItem(icon: Icons.shopping_cart, label: 'Bán hàng'),
                  _DrawerItem(icon: Icons.build, label: 'Thi công và Báo hỏng'),
                  _DrawerItem(icon: Icons.account_balance_wallet, label: 'Quản lý tài khoản'),
                  _DrawerItem(icon: Icons.help_outline, label: 'Tiện ích và Hỗ trợ'),
                  _DrawerItem(icon: Icons.settings, label: 'Cài đặt'),
                  _DrawerItem(icon: Icons.exit_to_app, label: 'Đăng xuất'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _DrawerItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
