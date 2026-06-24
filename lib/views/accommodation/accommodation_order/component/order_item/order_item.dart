import 'package:flutter/material.dart';
import 'package:hotel_manage/util/system_params.dart';

class OrderItem extends StatelessWidget {
  final String hotelName;
  final String roomType;
  final int? totalPrice;
  final String address;
  final String checkInDate;
  final int countNightNum;
  final String checkOutDate;
  final String landlordName;
  final String? landlordAvatar;
  final VoidCallback? onContactLandlord;
  final VoidCallback? onCancelOrder;
  final VoidCallback? onCallPhone;
  final VoidCallback? onChat;

  const OrderItem({
    super.key,
    this.hotelName = '丽江古城客栈',
    this.roomType = '标准间',
    this.totalPrice = 540,
    this.address = '丽江市古城区五一街789号',
    this.checkInDate = '2026-05-15',
    this.countNightNum = 0,
    this.checkOutDate = '2026-05-18',
    this.landlordName = '王老板',
    this.landlordAvatar,
    this.onContactLandlord,
    this.onCancelOrder,
    this.onCallPhone,
    this.onChat,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(containerRadian),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.circular(containerRadian),
        ),
        child: Column(
          children: [
            _buildHotelInfo(),
            _buildDivider(),
            _buildLandlordInfo(),
            _buildDivider(),
            _buildBottomButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHotelInfo() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(containerSmallRadian),
                ),
                child: Icon(Icons.apartment, color: Colors.grey[600], size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hotelName,
                      style: TextStyle(
                        fontSize: textTitleSize,
                        fontWeight: FontWeight.bold,
                        color: colorBlack,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      roomType,
                      style: TextStyle(
                        fontSize: textSmallSize,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '订单总价',
                    style: TextStyle(
                      fontSize: textSmallSize,
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '¥$totalPrice',
                    style: TextStyle(
                      fontSize: textTitleSize,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.location_on, size: 14, color: Colors.grey[400]),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  address,
                  style: TextStyle(fontSize: textSize, color: Colors.grey[600]),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(containerSmallRadian),
            ),
            child: Row(
              children: [
                Expanded(
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
                      const SizedBox(height: 4),
                      Text(
                        checkInDate,
                        style: TextStyle(
                          fontSize: textSize,
                          fontWeight: FontWeight.w500,
                          color: colorBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '$countNightNum晚',
                    style: TextStyle(
                      fontSize: textSize,
                      fontWeight: FontWeight.w500,
                      color: Colors.green[700],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '退房日期',
                        style: TextStyle(
                          fontSize: textSmallSize,
                          color: Colors.grey[500],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        checkOutDate,
                        style: TextStyle(
                          fontSize: textSize,
                          fontWeight: FontWeight.w500,
                          color: colorBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLandlordInfo() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.grey[200]!, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: landlordAvatar != null
                  ? Image.network(landlordAvatar!, fit: BoxFit.cover)
                  : Container(
                      color: Colors.grey[200],
                      child: Icon(
                        Icons.person,
                        color: Colors.grey[400],
                        size: 28,
                      ),
                    ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  landlordName,
                  style: TextStyle(
                    fontSize: textBigSize,
                    fontWeight: FontWeight.w500,
                    color: colorBlack,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              _buildActionButton(
                icon: Icons.phone,
                color: Colors.green,
                onTap: onCallPhone,
              ),
              const SizedBox(width: 8),
              _buildActionButton(
                icon: Icons.message,
                color: Colors.blue,
                onTap: onChat,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onContactLandlord,
              child: Container(
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: primaryColor, width: 1.5),
                  borderRadius: BorderRadius.circular(containerRadian),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.headset_mic, color: primaryColor, size: 20),
                    const SizedBox(width: 6),
                    Text(
                      '联系房东',
                      style: TextStyle(
                        fontSize: textBigSize,
                        fontWeight: FontWeight.w500,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: onCancelOrder,
              child: Container(
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(containerRadian),
                ),
                child: Center(
                  child: Text(
                    '取消订单',
                    style: TextStyle(
                      fontSize: textBigSize,
                      fontWeight: FontWeight.w500,
                      color: Colors.red[500],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(icon, color: color, size: 20),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(height: 1, color: Colors.grey[100]);
  }
}
