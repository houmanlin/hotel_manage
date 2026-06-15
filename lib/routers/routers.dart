import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_manage/views/ai_dialog/ai_dialog.dart';
import 'package:hotel_manage/views/book_info/book_info.dart';
import 'package:hotel_manage/views/hotelInfo/hotelInfo.dart';
import 'package:hotel_manage/views/hotel_list/hotel_list.dart';
import 'package:hotel_manage/views/login/login.dart';
import 'package:hotel_manage/views/skeleton/skeleton.dart';
import 'package:hotel_manage/views/hotel_room_list/hotel_room_list.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static const String home = '/';
  static const String loginPage = '/login';
  static const String aiDialog = '/aiDialog';
  static const String hotelList = '/hotel_list';
  static const String hotelRoomList = '/hotel_room_list';
  static const String hotelInfo = '/hotelInfo';
  static const String bookInfo = '/book_info';

  final GoRouter routes = GoRouter(
    initialLocation: "/",
    observers:[BotToastNavigatorObserver()],
    navigatorKey:navigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: home,
        builder: (BuildContext context, GoRouterState state) {
          return SkeletonPage();
        },
      ),
      GoRoute(
        path: loginPage,
        builder: (BuildContext context, GoRouterState state) {
          return LoginPage();
        },
      ),
      GoRoute(
        path: aiDialog,
        builder: (BuildContext context, GoRouterState state) {
          return AiDialog();
        },
      ),
      GoRoute(
        path: hotelList,
        builder: (BuildContext context, GoRouterState state) {
          return HotelListPage();
        },
      ),
      GoRoute(
        path: hotelRoomList,
        builder: (BuildContext context, GoRouterState state) {
          return HotelRoomListPage();
        },
      ),
      GoRoute(
        path: hotelInfo,
        builder: (BuildContext context, GoRouterState state) {
          return HotelInfoPage();
        },
      ),
      GoRoute(
        path: bookInfo,
        builder: (BuildContext context, GoRouterState state) {
          return BookInfoPage();
        },
      ),
    ],
  );

  static void goLogin(BuildContext context) {
    context.go(loginPage);
  }
}
