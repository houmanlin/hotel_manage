import 'package:flutter/material.dart';
import 'component/ActivityCard.dart';
import 'component/PreferenceCard.dart';
import 'component/ServiceCard.dart';
import 'component/UserMenuList.dart';
import 'component/UserInfo.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          UserInfo(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top:Radius.circular(8)),
                color: Colors.white
            ),
            child: Column(
              children: [
                ActivityCard(),
                UserMenuList(
                  items: [
                    MenuItem(icon: Icons.favorite_border, title: "我的点赞", count: "235"),
                    MenuItem(icon: Icons.bookmark_border, title: "我的收藏", count: "158"),
                    MenuItem(icon: Icons.refresh, title: "浏览历史"),
                    MenuItem(icon: Icons.people, title: "好友活跃排行"),
                  ],
                ),
                PreferenceCard(),
                ServiceCard(),
                UserMenuList(
                  items: [
                    MenuItem(icon: Icons.favorite_border, title: "隐私设计"),
                    MenuItem(icon: Icons.bookmark_border, title: "帮助与反馈"),
                  ],
                ),



                Container(
                  margin: EdgeInsets.symmetric(vertical: 40),
                  child: Text("退出登录"),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}