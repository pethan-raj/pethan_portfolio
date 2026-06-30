import 'package:flutter/material.dart';

class FloatingY extends StatefulWidget {
  final Widget child;
  final double offset;
  final Duration duration;

  const FloatingY({
    super.key,
    required this.child,
    this.offset = 12,
    this.duration = const Duration(seconds: 3),
  });

  @override
  State<FloatingY> createState() => _FloatingYState();
}

class _FloatingYState extends State<FloatingY>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);

    animation = Tween<double>(
      begin: 0,
      end: -widget.offset,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, child) {
        return Transform.translate(
          offset: Offset(0, animation.value),
          child: child,
        );
      },
      child: widget.child,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}