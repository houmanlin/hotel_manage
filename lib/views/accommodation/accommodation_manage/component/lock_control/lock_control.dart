import 'package:flutter/material.dart';
import 'package:hotel_manage/util/system_params.dart';

class LockControl extends StatelessWidget {
  final String hotelName;
  final String roomNo;
  final String address;
  final String checkInDate;
  final String checkOutDate;
  final int unlockCount;
  final int shareCount;
  final int permissionCount;
  final VoidCallback? onAppUnlock;
  final VoidCallback? onGeneratePassword;
  final VoidCallback? onUnlockRecord;
  final VoidCallback? onSharePermission;
  final VoidCallback? onPermissionManagement;

  const LockControl({
    super.key,
    this.hotelName = '大理洱海景觀民宿',
    this.roomNo = '302',
    this.address = '大理市古城区人民路123号',
    this.checkInDate = '',
    this.checkOutDate = '',
    this.unlockCount = 8,
    this.shareCount = 0,
    this.permissionCount = 0,
    this.onAppUnlock,
    this.onGeneratePassword,
    this.onUnlockRecord,
    this.onSharePermission,
    this.onPermissionManagement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(containerRadian),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildHeader(),
          _buildInfo(),
          _buildActionButtons(),
          _buildBottomFunctions(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hotelName,
            style: TextStyle(
              fontSize: textTitleSize,
              fontWeight: FontWeight.bold,
              color: colorBlack,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(containerSmallRadian),
            ),
            child: Text(
              roomNo,
              style: TextStyle(
                fontSize: textSmallSize,
                color: colorBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildInfoRow(Icons.location_on, address),
          SizedBox(height: 8),
          _buildInfoRow(Icons.calendar_today, '$checkInDate 至 $checkOutDate'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.grey[400]),
        SizedBox(width: 8),
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

  Widget _buildActionButtons() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onAppUnlock,
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(containerRadian),
                ),
                child: Center(
                  child: Text(
                    'APP开锁',
                    style: TextStyle(
                      fontSize: textBigSize,
                      fontWeight: FontWeight.bold,
                      color: colorWhite,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: onGeneratePassword,
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(containerRadian),
                ),
                child: Center(
                  child: Text(
                    '生成开门密码',
                    style: TextStyle(
                      fontSize: textBigSize,
                      color: colorBlack,
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

  Widget _buildBottomFunctions() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          _buildBottomItem(
            icon: Icons.history,
            title: '开锁记录',
            count: unlockCount,
            onTap: onUnlockRecord,
          ),
          Expanded(child: Container()),
          _buildBottomItem(
            icon: Icons.share,
            title: '分享权限',
            count: shareCount,
            onTap: onSharePermission,
          ),
          Expanded(child: Container()),
          _buildBottomItem(
            icon: Icons.settings,
            title: '权限管理',
            count: permissionCount,
            onTap: onPermissionManagement,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomItem({
    required IconData icon,
    required String title,
    required int count,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(containerCircle),
            ),
            child: Icon(icon, size: 20, color: Colors.grey[400]),
          ),
          SizedBox(height: 6),
          Text(
            title,
            style: TextStyle(
              fontSize: textSize,
              color: colorBlack,
            ),
          ),
          SizedBox(height: 2),
          Text(
            count == 0 ? '赚积分' : '${count}次',
            style: TextStyle(
              fontSize: textSmallSize,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
