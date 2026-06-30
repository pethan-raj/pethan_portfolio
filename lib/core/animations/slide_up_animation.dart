import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension SlideAnimation on Widget {
  Widget slideUp({
    Duration delay = Duration.zero,
  }) {
    return animate()
        .moveY(
          begin: 40,
          end: 0,
          duration: 700.ms,
          delay: delay,
        )
        .fadeIn();
  }
}