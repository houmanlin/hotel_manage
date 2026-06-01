import 'package:flutter/material.dart';

class MenuItem {
  final IconData icon;
  final String title;
  final String? count;

  const MenuItem({required this.icon, required this.title, this.count});
}

class UserMenuList extends StatelessWidget {
  final List<MenuItem> items;

  const UserMenuList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFEEEEEE),
            blurRadius: 4,
            offset: const Offset(0, 2),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(children: _buildMenuItems()),
    );
  }

  List<Widget> _buildMenuItems() {
    List<Widget> widgets = [];
    for (int i = 0; i < items.length; i++) {
      widgets.add(_buildMenuItem(items[i]));
      if (i < items.length - 1) {
        widgets.add(_buildDivider());
      }
    }
    return widgets;
  }

  Widget _buildMenuItem(MenuItem item) {
    return GestureDetector(
      onTap: (){
        print("123");
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Row(
          children: [
            Icon(item.icon, color: const Color(0xFF666666), size: 20),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                item.title,
                style: const TextStyle(color: Color(0xFF333333), fontSize: 15),
              ),
            ),
            if (item.count != null)
              Text(
                item.count!,
                style: const TextStyle(color: Color(0xFF999999), fontSize: 15),
              ),
            const SizedBox(width: 8),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFFCCCCCC),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 1,
      color: const Color(0xFFF0F0F0),
    );
  }
}
