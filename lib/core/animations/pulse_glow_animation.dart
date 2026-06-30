import 'package:flutter/material.dart';

class PulseGlow extends StatefulWidget {
  final Widget child;

  const PulseGlow({super.key, required this.child});

  @override
  State<PulseGlow> createState() => _PulseGlowState();
}

class _PulseGlowState extends State<PulseGlow>
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
    return AnimatedBuilder(
      animation: controller,
      builder: (_, child) {
        final glow = 10 + (controller.value * 20);
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: glow,
                spreadRadius: 2,
              ),
            ],
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}