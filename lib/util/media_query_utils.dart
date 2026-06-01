import 'package:flutter/material.dart';

/// 屏幕工具类
/// 
/// 用于获取屏幕相关的常用属性，在程序启动时初始化一次即可全局使用
/// 
/// 使用示例：
/// ```dart
/// void main() {
///   runApp(MyApp());
/// }
/// 
/// class MyApp extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     // 在根Widget中初始化
///     ScreenUtil.init(context);
///     return MaterialApp(
///       home: HomePage(),
///     );
///   }
/// }
/// 
/// // 在任意地方使用
/// Container(
///   width: ScreenUtil.screenWidth,
///   height: ScreenUtil.safeAreaHeight,
/// )
/// ```
class ScreenUtil {
  /// MediaQuery原始数据
  static late MediaQueryData _mediaQueryData;

  /// 屏幕宽度
  static late double screenWidth;

  /// 屏幕高度
  static late double screenHeight;

  /// 设备像素比
  static late double pixelRatio;

  /// 状态栏高度
  static late double statusBarHeight;

  /// 底部安全区域高度
  static late double bottomBarHeight;

  /// 文字缩放因子
  static late double textScaleFactor;

  /// 屏幕方向
  static late Orientation orientation;

  /// 初始化屏幕工具类
  /// 
  /// 应在程序启动时调用，建议在根Widget的build方法中调用
  /// 
  /// [context] - BuildContext上下文
  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    pixelRatio = _mediaQueryData.devicePixelRatio;
    statusBarHeight = _mediaQueryData.padding.top;
    bottomBarHeight = _mediaQueryData.padding.bottom;
    textScaleFactor = _mediaQueryData.textScaleFactor;
    orientation = _mediaQueryData.orientation;
  }

  /// 安全区域高度（屏幕高度 - 状态栏高度 - 底部安全区域高度）
  static double get safeAreaHeight => screenHeight - statusBarHeight - bottomBarHeight;

  /// 安全区域宽度（等同于屏幕宽度）
  static double get safeAreaWidth => screenWidth;

  /// 是否为竖屏
  static bool get isPortrait => orientation == Orientation.portrait;

  /// 是否为横屏
  static bool get isLandscape => orientation == Orientation.landscape;
}