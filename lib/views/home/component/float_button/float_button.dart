import 'package:flutter/material.dart';
import 'package:hotel_manage/util/media_query_utils.dart';
import 'package:hotel_manage/util/system_params.dart';

class FloatButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final IconData? icon;
  final double? initialTop;
  final double? size;
  final Color? backgroundColor;
  final Color? iconColor;
  final double edgeOffset;

  const FloatButton({
    super.key,
    this.onPressed,
    this.icon = Icons.add,
    this.initialTop = 200,
    this.size = 40,
    this.backgroundColor = primaryColor,
    this.iconColor = Colors.white,
    this.edgeOffset = 5,
  });

  @override
  State<FloatButton> createState() => _FloatButtonState();
}

class _FloatButtonState extends State<FloatButton> {
  late double _left;
  late double _top;
  double _screenWidth = 0;
  double _screenHeight = 0;
  double _safeAreaBottom = 0;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _top = widget.initialTop!;
    _left = -1;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenWidth = ScreenUtil.screenWidth;
    _screenHeight = ScreenUtil.screenHeight;
    _safeAreaBottom = ScreenUtil.bottomBarHeight;
    if (_left == -1) {
      _left = _screenWidth - widget.size! - widget.edgeOffset;
    }
  }

  /// 处理拖动开始事件
  /// 当用户开始拖动按钮时触发，设置拖动状态为true
  void _onPanStart(DragStartDetails details) {
    setState(() {
      _isDragging = true;
    });
  }

  /// 处理拖动更新事件
  /// 在拖动过程中持续调用，更新按钮位置并限制在有效范围内
  void _onPanUpdate(DragUpdateDetails details) {
    // 如果没有处于拖动状态，直接返回
    if (!_isDragging) return;

    setState(() {
      // 根据拖动增量更新按钮位置
      _left += details.delta.dx;
      _top += details.delta.dy;

      // 定义边界内边距
      const double padding = 10;
      
      // 限制水平位置：左右各留10像素边距
      _left = _left.clamp(padding, _screenWidth - widget.size! - padding);
      
      // 计算垂直方向的最大和最小位置
      double maxTop = _screenHeight - widget.size! - padding - _safeAreaBottom;
      double minTop = kToolbarHeight + padding;
      
      // 确保最大位置不小于最小位置（处理极端情况）
      if (maxTop < minTop) {
        maxTop = minTop;
      }
      
      // 限制垂直位置：顶部在导航栏下方10像素，底部留10像素边距（含安全区域）
      _top = _top.clamp(minTop, maxTop);
    });
  }

  /// 处理拖动结束事件
  /// 当用户停止拖动时触发，重置拖动状态并执行边缘吸附
  void _onPanEnd(DragEndDetails details) {
    setState(() {
      _isDragging = false;
      _snapToEdge();
    });
  }

  void _snapToEdge() {
    double halfWidth = _screenWidth / 2;
    double buttonCenter = _left + widget.size! / 2;

    setState(() {
      if (buttonCenter < halfWidth) {
        _left = widget.edgeOffset;
      } else {
        _left = _screenWidth - widget.size! - widget.edgeOffset;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _left,
      top: _top,
      child: GestureDetector(
        onPanStart: _onPanStart,
        onPanUpdate: _onPanUpdate,
        onPanEnd: _onPanEnd,
        child: Listener(
          onPointerDown: (_) {},
          child: SizedBox(
            width: widget.size,
            height: widget.size,
            child: ElevatedButton(
              onPressed: _isDragging ? null : widget.onPressed,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                fixedSize: Size(widget.size!, widget.size!),
                backgroundColor: widget.backgroundColor,
                padding: EdgeInsets.zero,
                elevation: _isDragging ? 8 : 4,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: Size(widget.size!, widget.size!),
              ),
              child: Icon(
                widget.icon,
                color: widget.iconColor,
                size: widget.size! * 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}