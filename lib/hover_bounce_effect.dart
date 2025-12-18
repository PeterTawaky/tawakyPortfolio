import 'package:flutter/material.dart';

class HoverBounceEffect extends StatefulWidget {
  final Widget child;
  final double debounceDegree;
  final int debounceDuration;
  const HoverBounceEffect({
    super.key,
    required this.child,
    this.debounceDegree = -10,
    this.debounceDuration = 400,
  });

  @override
  State<HoverBounceEffect> createState() => _HoverBounceEffectState();
}

class _HoverBounceEffectState extends State<HoverBounceEffect> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.debounceDuration),
        curve: Curves.elasticOut,
        transform: Matrix4.translationValues(
          0,
          isHover ? widget.debounceDegree : 0,
          0,
        ),

        child: widget.child,
      ),
    );
  }
}
