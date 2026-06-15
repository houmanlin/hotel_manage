import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_manage/util/media_query_utils.dart';
import 'package:hotel_manage/util/system_params.dart';
import 'package:hotel_manage/routers/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        scaffoldBackgroundColor: scaffoldBackgroundColor,
      ),
      routerConfig: AppRoutes().routes,       // 传入 GoRouter 配置
      builder: BotToastInit(), //1. call BotToastInit
    );
  }
}

