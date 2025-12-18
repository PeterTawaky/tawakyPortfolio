import 'package:flutter/material.dart';

class GradientCard extends StatefulWidget {
  final Widget child;
  final Color color1Begin;
  final Color color2Begin;
  final Color color1End;
  final Color color2End;
  const GradientCard({
    super.key,
    required this.child,
    required this.color1Begin,
    required this.color2Begin,
    required this.color1End,
    required this.color2End,
  });

  @override
  State<GradientCard> createState() => _GradientCardState();
}

class _GradientCardState extends State<GradientCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _color1;
  late Animation<Color?> _color2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    _color1 = ColorTween(
      begin: widget.color1Begin,
      end: widget.color1End,
    ).animate(_controller);
    _color2 = ColorTween(
      begin: widget.color2Begin,
      end: widget.color2End,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [_color1.value!, _color2.value!]),
            borderRadius: BorderRadius.circular(16),
          ),
          child: widget.child,
        );
      },
    );
  }
}
