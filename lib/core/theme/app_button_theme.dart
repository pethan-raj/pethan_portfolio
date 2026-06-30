import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppButtonTheme {
  static ElevatedButtonThemeData elevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.gold,
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 18,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
    ),
  );
}