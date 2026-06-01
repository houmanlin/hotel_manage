import 'package:flutter/material.dart';

class PreferenceCard extends StatelessWidget {
  PreferenceCard({super.key});

  final List<String> preferences = [
    "山景民宿",
    "海景房",
    "本地美食",
    "小众景点",
    "宠物友好",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFEEEEEE),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Color(0xFFF5A623),
                    size: 20,
                  ),
                  SizedBox(width: 6),
                  Text(
                    "我的偏好",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                "编辑",
                style: TextStyle(
                  color: Color(0xFFF5A623),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: preferences
                .map((preference) => _buildTag(preference))
                .toList(),
          ),
          SizedBox(height: 16),
          Text(
            "AI根据您的行为自动生成，可随时调整。",
            style: TextStyle(
              color: Color(0xFFAAAAAA),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xFF666666),
          fontSize: 13,
        ),
      ),
    );
  }
}