import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_manage/util/media_query_utils.dart';
import 'package:hotel_manage/util/system_params.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final String? url;

  MenuItem({
    required this.title,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    this.url,
  });
}

class MenuGrid extends StatelessWidget {
  final List<MenuItem> menuItems;
  final int crossAxisCount;
  final double itemSpacing;
  final double iconSize;

  const MenuGrid({
    super.key,
    required this.menuItems,
    this.crossAxisCount = 2,
    this.itemSpacing = 10,
    this.iconSize = 24,
  });

  @override
  Widget build(BuildContext context) {

    // 方式一：封装成一个方法
    int getCrossAxisCount() {
      double screenWidth = ScreenUtil.screenWidth;
      // 你可以根据设计稿调整这些阈值和对应的列数
      if (screenWidth >= 1200) {
        return 6; // 超大屏，如桌面端
      } else if (screenWidth >= 800) {
        return 4; // 平板或桌面
      } else if (screenWidth >= 600) {
        return 3; // 小平板或大屏手机横屏
      } else {
        return 2; // 手机竖屏
      }
    }
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: getCrossAxisCount(),
        mainAxisSpacing: itemSpacing,
        crossAxisSpacing: itemSpacing,
        childAspectRatio: 2,
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return _buildMenuItem(context, item);
      },
    );
  }

  Widget _buildMenuItem(BuildContext context, MenuItem item) {
    return GestureDetector(
      onTap: (){
        if(item.url == ""){
          var cancel = BotToast.showText(text:"xxxx");  //popup a text toast;
          print(cancel);
          return;
        }
        context.push(item.url!);
      },
      child: Container(
        height: 10,
        decoration: BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.circular(containerRadian),
          border: Border(
            left: BorderSide(
              color: item.iconBgColor,
              width: 4,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: item.iconBgColor,
                borderRadius: BorderRadius.circular(containerRadian),
              ),
              child: Icon(
                item.icon,
                color: item.iconColor,
                size: iconSize,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              item.title,
              style: TextStyle(
                fontSize: textSize,
                color: colorBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}