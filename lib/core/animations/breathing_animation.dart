import 'package:flutter/material.dart';


class BreathingAnimation extends StatefulWidget {
  final Widget child;

  const BreathingAnimation({super.key, required this.child});

  @override
  State<BreathingAnimation> createState() => _BreathingAnimationState();
}

class _BreathingAnimationState extends State<BreathingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween(begin: 1.0, end: 1.05).animate(controller),
      child: widget.child,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}