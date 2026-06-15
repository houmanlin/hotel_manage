import 'package:flutter/material.dart';
import 'package:hotel_manage/util/system_params.dart';

class HotelFilter extends StatelessWidget {
  final String checkInDate;
  final String checkOutDate;
  final String? hotelName;
  final String? roomType;
  final void Function()? onSearch;

  const HotelFilter({
    super.key,
    required this.checkInDate,
    required this.checkOutDate,
    this.hotelName,
    this.roomType,
    this.onSearch,
  });

  onCheckOutTap() {}

  onCheckInTap() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(containerRadian),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildDateRow(),
          SizedBox(height: 16),
          _buildInputRow(),
          SizedBox(height: 16),
          _buildSearchButton(),
        ],
      ),
    );
  }

  Widget _buildDateRow() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onCheckInTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '入住日期',
                  style: TextStyle(
                    fontSize: textSmallSize,
                    color: Colors.grey[500],
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      checkInDate.split(' ')[0],
                      style: TextStyle(
                        fontSize: textTitleSize,
                        fontWeight: FontWeight.bold,
                        color: colorBlack,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      checkInDate.split(' ')[1],
                      style: TextStyle(
                        fontSize: textSize,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(containerCircle),
          ),
          child: Icon(Icons.swap_horiz, size: 16, color: Colors.white),
        ),
        Expanded(
          child: GestureDetector(
            onTap: onCheckOutTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '离店日期',
                  style: TextStyle(
                    fontSize: textSmallSize,
                    color: Colors.grey[500],
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      checkOutDate.split(' ')[1],
                      style: TextStyle(
                        fontSize: textSize,
                        color: Colors.grey[500],
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      checkOutDate.split(' ')[0],
                      style: TextStyle(
                        fontSize: textTitleSize,
                        fontWeight: FontWeight.bold,
                        color: colorBlack,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInputRow() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: '您想酒店（请输入关键词）',
            hintStyle: TextStyle(fontSize: textSize, color: Colors.grey[400]),
            prefixIcon: Icon(Icons.search, size: 16, color: Colors.grey[400]),
            suffixIcon: Icon(
              Icons.location_on,
              size: 16,
              color: Colors.grey[400],
            ),
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(containerSmallRadian),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          ),
          style: TextStyle(fontSize: textSize),
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: '您想（请输入房型）',
            hintStyle: TextStyle(fontSize: textSize, color: Colors.grey[400]),
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(containerSmallRadian),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          ),
          style: TextStyle(fontSize: textSize),
        ),
      ],
    );
  }

  Widget _buildSearchButton() {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: ElevatedButton(
        onPressed: onSearch,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(containerCircle),
          ),
          elevation: 0,
        ),
        child: Text(
          '查找房型',
          style: TextStyle(
            fontSize: textTitleSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
