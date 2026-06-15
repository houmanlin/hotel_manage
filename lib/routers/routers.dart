import 'package:flutter/material.dart';
import 'package:hotel_manage/views/ai_dialog/ai_dialog.dart';
import 'package:hotel_manage/views/book_info/book_info.dart';
import 'package:hotel_manage/views/hotelInfo/hotelInfo.dart';
import 'package:hotel_manage/views/hotel_list/hotel_list.dart';
import 'package:hotel_manage/views/skeleton/skeleton.dart';
import 'package:hotel_manage/views/hotel_room_list/hotel_room_list.dart';



class AppRoutes {
  static const String home = '/';
  static const String aiDialog = '/aiDialog';
  static const String hotelList = '/hotel_list';
  static const String hotelRoomList = '/hotel_room_list';
  static const String hotelInfo = '/hotelInfo';

  static const String BookInfo = '/book_info';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => SkeletonPage(),
    aiDialog: (context) => AiDialog(),
    hotelList: (context) => HotelListPage(),
    hotelInfo: (context) => HotelInfoPage(),
    hotelRoomList: (context) => HotelRoomListPage(),
    BookInfo: (context) => BookInfoPage(),
  };
}

class CustomPageRoute extends PageRouteBuilder {
  final String routeName;

  CustomPageRoute({required this.routeName})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) {
            return AppRoutes.routes[routeName]!(context);
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut,
              )),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 300),
        );
}