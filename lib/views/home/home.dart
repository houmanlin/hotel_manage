import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_manage/api/model/withdrawCard/withdrawCard.dart';
import 'package:hotel_manage/components/app_home_bar.dart';
import 'package:hotel_manage/routers/index.dart';
import 'package:hotel_manage/util/system_params.dart';
import './component/recommend/recommend.dart';
import 'component/ai_entrance/ai_entrance.dart';
import 'component/float_button/float_button.dart';
import 'component/menu_grid/menu_grid.dart';
import 'component/reward_card/reward_card.dart';
import 'component/withdraw_card/withdraw_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _incrementCounter() {
    context.go(AppRoutes.aiDialog);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHomeAppBar(),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                // AI入口
                AiEntrance(),

                // 菜单宫格
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "每日必备",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: textTitleSize,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "签到情况",
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: textSmallSize,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: primaryColor,
                            size: textSmallSize,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                RewardCard(),
                MenuGrid(
                  menuItems: [
                    MenuItem(
                      title: '酒店民宿',
                      icon: Icons.maps_home_work_rounded,
                      iconBgColor: Color(0xFFE0F2FE),
                      iconColor: Color(0xFF0284C7),
                      url: AppRoutes.hotelList,
                    ),
                    MenuItem(
                      title: '必玩景点',
                      icon: Icons.location_on,
                      iconBgColor: Color(0xFFFEF3C7),
                      iconColor: Color(0xFFD97706),
                      url: "",
                    ),
                    MenuItem(
                      title: '本地美食',
                      icon: Icons.restaurant,
                      iconBgColor: Color(0xFFD1FAE5),
                      iconColor: Color(0xFF059669),
                      url: "",
                    ),
                    MenuItem(
                      title: '同城互动',
                      icon: Icons.people,
                      iconBgColor: Color(0xFFFCE7F3),
                      iconColor: Color(0xFFBE185D),
                      url: "",
                    ),
                  ],
                ),
                // 为您推荐
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "为您推荐",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: textTitleSize,
                        ),
                      ),
                    ],
                  ),
                ),
                LockControl(),
                // 旅游亮点
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "为你推荐",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: textTitleSize,
                    ),
                  ),
                ),
                WithdrawCardList(
                  withdrawCardList: [
                    WithdrawCard(
                      imageUrl: "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=300&q=80",
                      title: "洱海宁静时光",
                      description: "观鸟和拍摄平静水面的最佳地点",
                      tags: [
                        Tag(
                          name: '自然',
                          backgroundColor: Color(0xFFE8F5E9),
                          textColor: Color(0xFF2E7D32),
                        ),
                        Tag(
                          name: '摄影',
                          backgroundColor: Color(0xFFE3F2FD),
                          textColor: Color(0xFF1976D2),
                        ),
                      ],
                    ),

                    WithdrawCard(
                      imageUrl: "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=300&q=80",
                      title: "洱海宁静时光",
                      description: "观鸟和拍摄平静水面的最佳地点",
                      tags: [
                        Tag(
                          name: '自然',
                          backgroundColor: Color(0xFFE8F5E9),
                          textColor: Color(0xFF2E7D32),
                        ),
                        Tag(
                          name: '摄影',
                          backgroundColor: Color(0xFFE3F2FD),
                          textColor: Color(0xFF1976D2),
                        ),
                      ],
                    ),

                    WithdrawCard(
                      imageUrl: "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=300&q=80",
                      title: "洱海宁静时光",
                      description: "观鸟和拍摄平静水面的最佳地点",
                      tags: [
                        Tag(
                          name: '自然',
                          backgroundColor: Color(0xFFE8F5E9),
                          textColor: Color(0xFF2E7D32),
                        ),
                        Tag(
                          name: '摄影',
                          backgroundColor: Color(0xFFE3F2FD),
                          textColor: Color(0xFF1976D2),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          FloatButton(onPressed: _incrementCounter, icon: Icons.add),
        ],
      ),
    );
  }
}
