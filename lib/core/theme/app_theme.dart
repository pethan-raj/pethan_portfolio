import 'package:flutter/material.dart';
import 'app_text_theme.dart';
import 'app_button_theme.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        textTheme: AppTextTheme.textTheme,
        elevatedButtonTheme: AppButtonTheme.elevatedButtonTheme,
        useMaterial3: true,
      );
}