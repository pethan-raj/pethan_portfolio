import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pethan_portfolio/core/animations/hover_scale_animation.dart';
import 'package:pethan_portfolio/core/theme/app_decoration.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final double radius;
  final BoxDecoration? boxDecoration;

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.radius = 24,
    this.boxDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return HoverScale(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            padding: padding ?? const EdgeInsets.all(20),
            decoration:
                boxDecoration ?? AppDecoration.glassDecoration(radius: radius),
            child: child,
          ),
        ),
      ),
    );
  }
}
