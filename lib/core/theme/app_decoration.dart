import 'package:flutter/material.dart';
import 'package:pethan_portfolio/core/constants/app_colors.dart';

class AppDecoration {
  static BoxDecoration yelloGlassDecoration({double radius = 200}) {
    return BoxDecoration(
      border: Border.all(color: AppColors.gold.withAlpha(24), width: 1.5),
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
          color: AppColors.gold.withAlpha(12),
          blurRadius: 40,
          spreadRadius: 0.8,
        ),
      ],
    );
  }

  static BoxDecoration glassDecoration({double radius = 20}) {
    return BoxDecoration(
      color: AppColors.glass,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: AppColors.border),

      boxShadow: [
        BoxShadow(
          color: Colors.black38,
          blurRadius: 24,
          offset: const Offset(0, 10),
        ),
      ],
    );
  }
}
