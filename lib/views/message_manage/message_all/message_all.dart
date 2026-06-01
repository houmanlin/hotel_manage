import 'package:flutter/cupertino.dart';
import 'package:hotel_manage/util/system_params.dart';

import '../component/interaction_message/interaction_message.dart';

class MessageAll extends StatelessWidget {
  const MessageAll({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _messages = [
      {
        'username': '陈琦',
        'action': '植物园漫步',
        'comment': '高原上的晨光~',
        'time': '2分钟前',
      },
      {
        'username': '张明',
        'action': '洱海骑行',
        'comment': '风吹过的感觉真好！',
        'time': '10分钟前',
      },
      {
        'username': '李雪',
        'action': '古街探索',
        'comment': '发现了一家很棒的小店~',
        'time': '30分钟前',
      },
    ];
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "近期互动",
              style: TextStyle(fontSize: textSmallSize, color: primaryColor),
            ),
            Text(
              "全部标记已读",
              style: TextStyle(fontSize: textSmallSize, color: primaryColor),
            ),
          ],
        ),
        ..._messages.map((item) => InteractionMessage(
          username: item['username'],
          action: item['action'],
          comment: item['comment'],
          time: item['time'],
          key: ValueKey('${item['username']}_${item['time']}'), // 添加唯一 Key
        )),
      ],
    );
  }
}
