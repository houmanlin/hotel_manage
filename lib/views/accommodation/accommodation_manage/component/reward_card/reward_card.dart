import 'package:flutter/material.dart';
import 'package:hotel_manage/util/system_params.dart';

class RewardCard extends StatelessWidget {
  final VoidCallback? onKnowMore;

  const RewardCard({
    super.key,
    this.onKnowMore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(containerRadian),
      ),
      child: Row(
        children: [
          _buildIcon(),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(),
                SizedBox(height: 4),
                _buildDescription(),
              ],
            ),
          ),
          SizedBox(width: 12),
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Color(0xFFFFB366),
        borderRadius: BorderRadius.circular(containerSmallRadian),
      ),
      child: Icon(Icons.card_giftcard, size: 24, color: colorWhite),
    );
  }

  Widget _buildTitle() {
    return Text(
      '住宿体验双倍奖励',
      style: TextStyle(
        fontSize: textTitleSize,
        fontWeight: FontWeight.bold,
        color: colorBlack,
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      '退房后发布笔记可获16优惠券',
      style: TextStyle(
        fontSize: textSize,
        color: Color(0xFFFF8C00),
      ),
    );
  }

  Widget _buildButton() {
    return GestureDetector(
      onTap: onKnowMore,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(containerCircle),
        ),
        child: Text(
          '了解详情',
          style: TextStyle(
            fontSize: textSize,
            color: colorWhite,
          ),
        ),
      ),
    );
  }
}
