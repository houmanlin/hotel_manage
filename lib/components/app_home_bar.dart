import 'package:flutter/material.dart';
import 'package:hotel_manage/util/system_params.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final double? elevation;

  const CustomHomeAppBar({
    super.key,

    this.backgroundColor = Colors.white,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(radius: 50, child: Text("默认")),
          ),
          Expanded(
            child: Text("测试用户", style: TextStyle(fontSize: textBigSize)),
          ),
          GestureDetector(
            child: SizedBox(width: 60, height:40,child: Icon(Icons.support_agent),),
            onTap: (){

            },
          ),
        ],
      ),
      centerTitle: true,
      elevation: elevation,
      backgroundColor: backgroundColor,
      surfaceTintColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
