import 'package:flutter/material.dart';

class ContinuousBounceEffect extends StatefulWidget {
  final Widget child;
  final double bounceDistance; // مقدار الحركة لأعلى وأسفل
  final int duration; // مدة الحركة الأساسية
  final double speedFactor; // كلما زاد الرقم الحركة تبطأ

  const ContinuousBounceEffect({
    super.key,
    required this.child,
    this.bounceDistance = -10,
    this.duration = 800,
    this.speedFactor = 1.0, // 1x = طبيعي, 2x = أبطأ, 0.5x = أسرع
  });

  @override
  State<ContinuousBounceEffect> createState() => _ContinuousBounceEffectState();
}

class _ContinuousBounceEffectState extends State<ContinuousBounceEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // اضرب المدة في السرعة
    final adjustedDuration = (widget.duration * widget.speedFactor)
        .toInt()
        .clamp(200, 100000);

    _controller = AnimationController(
      duration: Duration(milliseconds: adjustedDuration),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: widget.bounceDistance).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut, // أهدى من elasticOut
      ),
    );
  }

  @override
  void didUpdateWidget(covariant ContinuousBounceEffect oldWidget) {
    super.didUpdateWidget(oldWidget);

    // إعادة حساب المدة لو تغيرت السرعة أو الـ duration
    if (oldWidget.duration != widget.duration ||
        oldWidget.speedFactor != widget.speedFactor) {
      final adjustedDuration = (widget.duration * widget.speedFactor)
          .toInt()
          .clamp(200, 100000);

      _controller.duration = Duration(milliseconds: adjustedDuration);
      _controller.reset();
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
