import 'package:flutter/material.dart';

class HoverScale extends StatefulWidget {
  final Widget child;

  const HoverScale({super.key, required this.child});

  @override
  State<HoverScale> createState() => _HoverScaleState();
}

class _HoverScaleState extends State<HoverScale> {
  double scale = 1;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => scale = 1.03),
      onExit: (_) => setState(() => scale = 1),
      child: AnimatedScale(
        scale: scale,
        duration: const Duration(milliseconds: 250),
        child: widget.child,
      ),
    );
  }
}