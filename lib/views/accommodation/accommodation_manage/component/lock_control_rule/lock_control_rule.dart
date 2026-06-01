import 'package:flutter/material.dart';
import 'package:hotel_manage/util/system_params.dart';

class LockControlRule extends StatelessWidget {
  const LockControlRule({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(containerRadian),
        border:Border.all(color: Colors.black, width: 1, style: BorderStyle.solid)
      ),
      child: Column(
        children: [
          _buildHeader(),
          SizedBox(height: 16),
          _buildRules(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(containerCircle),
          ),
          child: Icon(Icons.info_outline, size: 14, color: Color(0xFFFFB366)),
        ),
        SizedBox(width: 8),
        Text(
          '温馨提示',
          style: TextStyle(
            fontSize: textTitleSize,
            fontWeight: FontWeight.bold,
            color: colorBlack,
          ),
        ),
      ],
    );
  }

  Widget _buildRules() {
    final rules = [
      '首次使用请确认蓝牙已开启',
      '开锁时请靠近门锁（1米内）',
      '开锁时请靠近门锁',
      '如遇问题请联系客服或房东',
    ];

    return Column(
      children: rules
          .map((rule) => Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: _buildRuleItem(rule),
              ))
          .toList(),
    );
  }

  Widget _buildRuleItem(String text) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        SizedBox(width: 12),
        Text(
          text,
          style: TextStyle(
            fontSize: textSize,
            color: colorBlack,
          ),
        ),
      ],
    );
  }
}
