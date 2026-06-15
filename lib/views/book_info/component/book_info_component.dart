import 'package:flutter/material.dart';
import 'package:hotel_manage/util/system_params.dart';

class BookInfoComponent extends StatelessWidget {
  final String checkInDate;
  final String checkOutDate;
  final String roomType;
  final String roomDetails;
  final String cancelPolicy;
  final VoidCallback? onRoomDetailTap;
  final VoidCallback? onBookingReadTap;

  const BookInfoComponent({
    super.key,
    required this.checkInDate,
    required this.checkOutDate,
    required this.roomType,
    required this.roomDetails,
    required this.cancelPolicy,
    this.onRoomDetailTap,
    this.onBookingReadTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(containerRadian),
      ),
      child: Column(
        children: [
          _buildDateSection(),
          _buildRoomInfoSection(),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildDateSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                _buildDateItem(checkInDate, '今天', true),
                Container(width: 10, height: 1, color: Colors.grey, margin: EdgeInsets.symmetric(horizontal: 10)),
                _buildDateItem(checkOutDate, '明天', false),
                _nightText(),
              ],
            ),
          ),

          TextButton(
            onPressed: onRoomDetailTap,
            child: Row(
              children: [
                Text(
                  '房型详情',
                  style: TextStyle(fontSize: textSize, color: primaryColor),
                ),
                Icon(Icons.chevron_right, color: primaryColor, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateItem(String date, String label, bool isCheckIn) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          date,
          style: TextStyle(
            fontSize: textTitleSize,
            fontWeight: FontWeight.bold,
            color: isCheckIn ? primaryColor : Colors.black87,
          ),
        ),
        SizedBox(width: 5),
        Text(
          label,
          style: TextStyle(fontSize: textSize, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildRoomInfoSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            roomType,
            style: TextStyle(
              fontSize: textTitleSize,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          Text(
            roomDetails,
            style: TextStyle(fontSize: textSize, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _nightText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13, vertical: 2),margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(containerBigRadian),
        border: BoxBorder.all(width: 1, color: backgroundColor as Color),
      ),
      child: Text('1晚', style: TextStyle(fontSize: textSize)),
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              cancelPolicy,
              style: TextStyle(fontSize: 14, color: Colors.green),
            ),
          ),
          TextButton(
            onPressed: onBookingReadTap,
            child: Row(
              children: [
                Text(
                  '订房必读',
                  style: TextStyle(fontSize: textSize, color: primaryColor),
                ),
                Icon(Icons.chevron_right, color: primaryColor, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
