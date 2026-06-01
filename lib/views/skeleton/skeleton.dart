import 'package:flutter/material.dart';
import 'package:hotel_manage/components/custom_bottom_bavbar.dart';
import 'package:hotel_manage/util/system_params.dart';
import 'package:hotel_manage/views/accommodation/accommodation.dart';
import 'package:hotel_manage/views/creation/creation.dart';
import 'package:hotel_manage/views/home/home.dart';
import 'package:hotel_manage/views/message_manage/message_manage.dart';
import 'package:hotel_manage/views/my/my.dart';

class SkeletonPage extends StatefulWidget {
  @override
  _SkeletonPageState createState() => _SkeletonPageState();
}

class _SkeletonPageState extends State<SkeletonPage> {
  int _currentIndex = 0; // 当前选中的页面索引
  final List<Widget> _pages = [
    HomePage(),
    CreationPage(),
    AccommodationPage(),
    MessageManage(),
    MyPage(),
  ];

  void _checkPage(int currentIndex) {
    setState(() {
      _currentIndex = currentIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // 根据选中索引显示对应的页面
      bottomNavigationBar: CustomBottomNavBar(onCheckPage: _checkPage, currentIndex: _currentIndex),
      // 浮动按钮
      floatingActionButton: Padding(
        padding: EdgeInsetsGeometry.only(top: 20),
        child: GestureDetector(
            onTap: () => _checkPage(2),
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(
                Icons.airline_seat_individual_suite,
                size: 30,
                color: _currentIndex == 2
                    ? primaryColor
                    : Color.fromRGBO(158, 158, 158, 1),
              ),
            ),

        ),

      ),
      // 设置浮动按钮位置底部居中
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
