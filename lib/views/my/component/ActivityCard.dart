import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.only(top: 20),
        child: Row(
          children: [
            Expanded(
              child: _buildCard(
                icon: Icons.edit_note,
                iconColor: Color(0xFFF5A623),
                title: "创作者中心",
                subTitle: "我的笔记",
                count: "48",
                unit: "篇",
                badge: "Lv.5",
                badgeColor: Color(0xFFE8E8E8),
                badgeTextColor: Color(0xFF888888),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildCard(
                icon: Icons.calendar_today,
                iconColor: Color(0xFFF5A623),
                title: "活跃中心",
                subTitle: "连续签到",
                count: "7",
                unit: "天",
                badge: "3个活动",
                badgeColor: Color(0xFFF5A623),
                badgeTextColor: Colors.white,
              ),
            ),
          ],
        ),
      );
  }

  Widget _buildCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subTitle,
    required String count,
    required String unit,
    required String badge,
    required Color badgeColor,
    required Color badgeTextColor,
  }) {
    return Container(
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
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 20,
              ),
              SizedBox(width: 6),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            subTitle,
            style: TextStyle(
              color: Color(0xFF999999),
              fontSize: 13,
            ),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Text(
                count,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                unit,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  badge,
                  style: TextStyle(
                    color: badgeTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}