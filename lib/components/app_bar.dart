import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String? title;
  final Widget? titleWight;
  final Widget? trailing;
  final Color? backgroundColor;
  final double? elevation;

  const CustomAppBar({
    super.key,
    this.leading,
    this.title,
    this.titleWight,
    this.trailing,
    this.backgroundColor = Colors.white,
    this.elevation = 0,
  }) : assert(title == null || titleWight == null, 'title与titleWidget必须有一个存在');

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: titleWight ?? Text(title!, style: TextStyle(
        fontSize: 17
      ),),
      centerTitle: true,
      elevation: elevation,
      backgroundColor: backgroundColor,
      surfaceTintColor: backgroundColor,
      actions: trailing != null ? [trailing!] : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}