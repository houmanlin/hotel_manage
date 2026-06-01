import 'package:flutter/material.dart';

class SlideUnlock extends StatefulWidget {
  final double height;
  final double thumbWidth;
  final Color backgroundColor;
  final Color activeColor;
  final Color thumbColor;
  final String lockedText;
  final String unlockedText;
  final String loadingText;
  final String successText;
  final Duration resetDelay;
  final Duration animationDuration;
  final double unlockThreshold;
  final IconData lockedIcon;
  final IconData unlockedIcon;
  final IconData loadingIcon;
  final double iconSize;
  final Future<bool> Function()? onUnlocked;
  final Future<void> Function()? onComplete;

  const SlideUnlock({
    super.key,
    this.height = 48,
    this.thumbWidth = 60,
    this.backgroundColor = const Color(0xFFE8E8E8),
    this.activeColor = const Color(0xFF4A9D7C),
    this.thumbColor = Colors.white,
    this.lockedText = '滑动解锁',
    this.unlockedText = '已解锁',
    this.loadingText = '处理中...',
    this.successText = '操作成功',
    this.resetDelay = const Duration(seconds: 1),
    this.animationDuration = const Duration(milliseconds: 300),
    this.unlockThreshold = 0.95,
    this.lockedIcon = Icons.lock,
    this.unlockedIcon = Icons.lock_open,
    this.loadingIcon = Icons.lock_clock_rounded,
    this.iconSize = 20,
    this.onUnlocked,
    this.onComplete,
  });

  @override
  State<SlideUnlock> createState() => _SlideUnlockState();
}

class _SlideUnlockState extends State<SlideUnlock> {
  double _offset = 0;
  bool _isUnlocked = false;
  bool _isLoading = false;
  bool _isSuccess = false;
  bool _isDragging = false;
  late double _maxOffset;
  late double _containerWidth;

  Future<void> _handleUnlock() async {
    setState(() {
      _isLoading = true;
    });

    if (widget.onUnlocked != null) {
      try {
        bool success = await widget.onUnlocked!();
        if (success && mounted) {
          setState(() {
            _isLoading = false;
            _isSuccess = true;
          });

          await Future.delayed(widget.resetDelay);

          if (mounted) {
            setState(() {
              _isUnlocked = false;
              _isSuccess = false;
              _offset = 0;
            });
            await widget.onComplete!();
          }
        } else if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      } catch (e) {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _containerWidth = constraints.maxWidth;
        _maxOffset = _containerWidth - widget.thumbWidth;

        return Container(
          height: widget.height,
          width: double.infinity,
          decoration: BoxDecoration(
            color: _isUnlocked || _isSuccess
                ? widget.activeColor
                : widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.height / 2),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedSwitcher(
                duration: widget.animationDuration,
                child: _isLoading
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: widget.iconSize,
                            height: widget.iconSize,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            widget.loadingText,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      )
                    : _isSuccess
                        ? Text(
                            widget.successText,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : _isUnlocked
                            ? Text(
                                widget.unlockedText,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            : Text(
                                widget.lockedText,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
              ),
              AnimatedPositioned(
                left: _isUnlocked || _isLoading || _isSuccess
                    ? _maxOffset
                    : _offset,
                duration: _isLoading || _isSuccess
                    ? widget.animationDuration
                    : Duration.zero,
                curve: Curves.easeOut,
                child: GestureDetector(
                  onPanStart: (details) {
                    if (!_isUnlocked && !_isLoading && !_isSuccess) {
                      setState(() {
                        _isDragging = true;
                      });
                    }
                  },
                  onPanUpdate: (details) {
                    if (_isDragging &&
                        !_isUnlocked &&
                        !_isLoading &&
                        !_isSuccess) {
                      setState(() {
                        _offset += details.delta.dx;
                        if (_offset < 0) _offset = 0;
                        if (_offset > _maxOffset) _offset = _maxOffset;
                      });

                      if (_offset >= _maxOffset * widget.unlockThreshold) {
                        setState(() {
                          _isUnlocked = true;
                          _offset = _maxOffset;
                          _isDragging = false;
                        });
                        _handleUnlock();
                      }
                    }
                  },
                  onPanEnd: (details) {
                    if (_isDragging &&
                        !_isUnlocked &&
                        !_isLoading &&
                        !_isSuccess) {
                      setState(() {
                        _isDragging = false;
                        if (_offset < _maxOffset * 0.9) {
                          _offset = 0;
                        }
                      });
                    }
                  },
                  child: Container(
                    width: widget.thumbWidth,
                    height: widget.height - 4,
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    decoration: BoxDecoration(
                      color: widget.thumbColor,
                      borderRadius: BorderRadius.circular(
                        (widget.height - 4) / 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _isLoading
                            ? SizedBox(
                                width: widget.iconSize,
                                height: widget.iconSize,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    widget.activeColor,
                                  ),
                                ),
                              )
                            : Icon(
                                _isSuccess
                                    ? widget.unlockedIcon
                                    : _isUnlocked
                                        ? widget.unlockedIcon
                                        : widget.lockedIcon,
                                color: _isUnlocked || _isSuccess
                                    ? widget.activeColor
                                    : Colors.grey[500],
                                size: widget.iconSize,
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}