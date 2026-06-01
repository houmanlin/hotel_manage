import 'package:flutter/material.dart';
import 'package:hotel_manage/components/app_home_bar.dart';

import 'package:hotel_manage/util/system_params.dart';
import 'package:hotel_manage/views/message_manage/component/title/MessageHeader.dart';

import 'message_all/message_all.dart';

class MessageManage extends StatefulWidget {
  const MessageManage({super.key});

  @override
  State<MessageManage> createState() => _MessageManageState();
}

class _MessageManageState extends State<MessageManage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> pageList = [MessageAll(),MessageAll(),MessageAll(),MessageAll(),MessageAll()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHomeAppBar(),
      body: Container(
        color: colorWhite,
        child: Stack(
          children: [
            PageView.builder(
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              controller: _pageController,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) => Container(
                padding: EdgeInsets.only(left: 10,right: 10, top: 10),
                color: colorGrey,
                margin: EdgeInsets.only(top: 95),
                child: pageList[index],
              ),
            ),
            Positioned(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: MessageHeader(
                  controllerIndex: _currentPage,
                  onCheckPage: (index) {
                    _pageController.jumpToPage(index);
                    setState(() {
                      _currentPage = index;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
