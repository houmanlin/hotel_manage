import 'package:flutter/material.dart';
import 'package:hotel_manage/routers/index.dart';
import 'package:hotel_manage/util/system_params.dart';

class AiEntrance extends StatelessWidget {
  const AiEntrance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(containerBigRadian),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 16,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '早上好, 周老先生',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: textTitleSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '你的旅居生活伙伴，帮你发现更懂你的旅行体验',
                    style: TextStyle(color: Colors.white70, fontSize: textSize),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CustomPageRoute(routeName: AppRoutes.aiDialog),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(containerCircle),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Icon(Icons.message),
                    Text('开始对话', style: TextStyle(color: primaryColor))
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
