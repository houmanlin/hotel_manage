import 'package:flutter/material.dart';

class RoomList extends StatelessWidget {
  const RoomList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 8),
      child: Column(
        children: [
          _buildTabBar(),
          _buildDateSelector(),
          _buildRoomList(),
          _buildExpandButton(),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      padding: EdgeInsets.only(left: 10, right:10, top: 15),
      child: Row(
        children: [
          _buildTabItem('团购', true),
          SizedBox(width: 24),
          _buildTabItem('设施', false),
          SizedBox(width: 24),
          _buildTabItem('评价 326', false),
          SizedBox(width: 24),
          _buildTabItem('推荐', false),
        ],
      ),
    );
  }

  Widget _buildTabItem(String label, bool isActive) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            color: isActive ? Colors.black87 : Colors.grey,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 4),
          height: 2,
          width: 30,
          color: isActive ? Colors.red : Colors.white,
        ),
      ],
    );
  }

  Widget _buildDateSelector() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color.fromRGBO(245,245,245, 1), width: 2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: const [
              Text(
                '价格日历',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Icon(Icons.chevron_right, color: Colors.grey, size: 16),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDateRange(String date, String label, String subLabel) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            date,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(label, style: TextStyle(fontSize: 12, color: Colors.grey)),
              SizedBox(width: 4),
              Text(
                subLabel,
                style: TextStyle(fontSize: 12, color: Colors.orange),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget _buildFilterTags() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  //     child: Row(
  //       children: [
  //         _buildFilterTag('大床房'),
  //         SizedBox(width: 8),
  //         _buildFilterTag('双床房'),
  //         SizedBox(width: 8),
  //         _buildFilterTag('大面积房型'),
  //         SizedBox(width: 8),
  //         _buildFilterTag('钟点房', showIcon: true),
  //         SizedBox(width: 8),
  //         _buildFilterTag('免费取'),
  //         Spacer(),
  //         TextButton(
  //           onPressed: () {},
  //           child: Row(
  //             children: [
  //               Text(
  //                 '筛选',
  //                 style: TextStyle(fontSize: 14, color: Colors.grey),
  //               ),
  //               Icon(Icons.arrow_drop_down, color: Colors.grey, size: 16),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildFilterTag(String label, {bool showIcon = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          if (showIcon) Icon(Icons.timer, color: Colors.grey, size: 12),
          if (showIcon) SizedBox(width: 4),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
        ],
      ),
    );
  }

  Widget _buildRoomList() {
    return Column(children: [_buildRoomItem()]);
  }

  Widget _buildRoomItem() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color.fromRGBO(245,245,245, 1), width: 2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=200&q=80',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRoomTitle(),
                SizedBox(height: 8),
                _buildRoomFeatures(),
                SizedBox(height: 8),
                _buildRoomFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoomTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '[全城热卖] 3小时钟点房+大床/双床任选+停车方便',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildRoomFeatures() {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.check, color: Colors.green, size: 12),
            SizedBox(width: 4),
            Expanded(
              child: Text(
                '住: 观景高级大床房/观景高级双床房共1项',
                style: TextStyle(fontSize: 12, color: Colors.grey),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.check, color: Colors.green, size: 12),
            SizedBox(width: 4),
            Expanded(
              child: Text(
                '享: 健身服务(1份)+室内高尔夫体验(1份)+自助洗...共5项',
                style: TextStyle(fontSize: 12, color: Colors.grey),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.check, color: Colors.green, size: 12),
            SizedBox(width: 4),
            Text(
              '9:00-23:00可住',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(width: 12),
            Text('可约今日', style: TextStyle(fontSize: 12, color: Colors.green)),
            SizedBox(width: 8),
            Text('不可退', style: TextStyle(fontSize: 12, color: Colors.orange)),
          ],
        ),
      ],
    );
  }

  Widget _buildRoomFooter() {
    return Row(
      children: [
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Text(
                  '¥105',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  '¥88',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                Text('/3小时', style: TextStyle(fontSize: 12, color: Colors.red)),
              ],
            ),
            Text(
              '8.4折热销中',
              style: TextStyle(fontSize: 10, color: Colors.orange),
            ),
          ],
        ),
        SizedBox(width: 12),

        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            elevation: 0,
          ),
          child: Text('预订'),
        ),
      ],
    );
  }

  Widget _buildExpandButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '展开"不满足所选日期"的其他团购',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          Icon(Icons.chevron_right, color: Colors.grey, size: 16),
        ],
      )
    );
  }
}
