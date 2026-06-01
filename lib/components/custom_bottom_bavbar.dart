import 'package:flutter/material.dart';
import 'package:hotel_manage/util/system_params.dart';

class CustomBottomNavBar extends StatefulWidget {
  CustomBottomNavBar({
    super.key,
    required this.onCheckPage,
    this.currentIndex = 0,
  }) : assert(onCheckPage != null, "onCheckPage回调必传");

  final void Function(int selectIndex) onCheckPage;
  int currentIndex;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {


  // 自定义构建单个导航项
  Widget _buildNavItem(int index, String title, IconData icon) {
    final isSelected = widget.currentIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (widget.currentIndex != index) {
            setState(() {
              widget.currentIndex = index; // 更新索引以切换页面和样式
            });
            widget.onCheckPage(widget.currentIndex);
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 3),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: isSelected ? primaryColor : Colors.grey),
              SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? primaryColor : Colors.grey,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          // 添加一点阴影效果
          BoxShadow(blurRadius: 10, color: Colors.grey.shade200),
        ],
      ),
      child: Row(
        spacing: 10,
        children: [
          _buildNavItem(0, '首页', Icons.home),
          _buildNavItem(1, '创作', Icons.border_color),
          _buildNavItem(2, '住宿', Icons.airline_seat_individual_suite),
          _buildNavItem(3, '消息', Icons.forum),
          _buildNavItem(4, '我的', Icons.person),
        ],
      ),
    );
  }
}
