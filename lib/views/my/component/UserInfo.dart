import 'package:flutter/material.dart';
import 'package:hotel_manage/util/system_params.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                    size: 24,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 24,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Row(
              children: [
                Stack(
                  children: [
                    ClipOval(
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.white60,
                        child: Image.network(
                          "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=200&q=80",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return _buildDefaultAvatar();
                          },
                          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                            return _buildDefaultAvatar();
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Icon(
                        Icons.add_circle,
                        color: Color(0xFFF5A623),
                        size: 28,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "兹防奈",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 12),
                            _Badge(text: "优质创作者"),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          "ID: 28491038",
                          style: TextStyle(
                            color: colorBlack,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.share_outlined,
                    color: Colors.white,
                    size: 22,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            margin: EdgeInsets.only(bottom: 24),
            child: Text(
              "在大理寻找生活之美。热爱摄影与地道美食的数字游民。",
              style: TextStyle(
                color: colorBlack,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Color.fromRGBO(245,245,245, 1), width: 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem("126", "关注"),
                VerticalDivider(color: Color(0xFF4A4A4F), width: 1),
                _buildStatItem("582", "粉丝"),
                VerticalDivider(color: Color(0xFF4A4A4F), width: 1),
                _buildStatItem("4.2k", "获赞与收藏"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: colorBlack, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildDefaultAvatar() {
    return Container(
      width: 80,
      height: 80,
      color: Colors.grey[300],
      child: Icon(
        Icons.person,
        color: Colors.grey[500],
        size: 60,
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;

  _Badge({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: Color(0xFFF5A623),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
