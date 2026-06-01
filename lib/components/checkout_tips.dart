import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hotel_manage/util/system_params.dart';

class CheckoutTips extends StatelessWidget {
  const CheckoutTips({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.yellow[50],
        borderRadius: BorderRadius.circular(containerRadian),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, color: Colors.orange, size: 14),
              SizedBox(width: 6),
              Text(
                '退房前别忘了:',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Text(
            '发布住宿体验笔记可获下次入住优惠券，笔记内嵌链接成交可赚提成！',
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 36,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF6B35),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(containerSmallRadian),
                ),
              ),
              child: Text(
                '立即发布笔记',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}