import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';

extension FadeAnimation on Widget {
  Widget fadeIn({
    Duration delay = Duration.zero,
  }) {
    return animate()
        .fadeIn(duration: 600.ms, delay: delay);
  }
}