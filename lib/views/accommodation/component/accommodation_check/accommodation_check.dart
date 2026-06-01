import 'package:flutter/material.dart';
import 'package:hotel_manage/util/system_params.dart';

class AccommodationCheck extends StatefulWidget {
  final void Function(int selectIndex) onAccommodationCheck;
  int currentIndex;

  AccommodationCheck({
    super.key,
    required this.onAccommodationCheck,
    this.currentIndex = 1,
  });

  @override
  State<AccommodationCheck> createState() => _AccommodationCheckState();
}

class _AccommodationCheckState extends State<AccommodationCheck> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: Row(
        children: [
          Expanded(
            child: _buildButton(
              title: '我的门锁',
              icon: Icons.lock,
              backgroundColor: widget.currentIndex == 1
                  ? primaryColor
                  : Colors.grey[200]!,
              textColor: widget.currentIndex == 1 ? colorWhite : colorBlack,
              iconColor: widget.currentIndex == 1
                  ? colorWhite
                  : Colors.grey[600]!,
              onTap: () => widget.onAccommodationCheck(1),
            ),
          ),
          Expanded(
            child: _buildButton(
              title: '我的订单',
              icon: Icons.receipt,
              backgroundColor: widget.currentIndex == 2
                  ? primaryColor
                  : Colors.grey[200]!,
              textColor: widget.currentIndex == 2 ? colorWhite : colorBlack,
              iconColor: widget.currentIndex == 2
                  ? colorWhite
                  : Colors.grey[600]!,
              onTap: () => widget.onAccommodationCheck(2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String title,
    required IconData icon,
    required Color backgroundColor,
    required Color textColor,
    required Color iconColor,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(containerRadian),
        ),
        child: Column(
          children: [
            Icon(icon, size: 20, color: iconColor),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: textSize, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
