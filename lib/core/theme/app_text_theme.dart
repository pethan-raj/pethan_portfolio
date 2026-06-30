

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class AppTextTheme {
  static TextTheme get textTheme => TextTheme(
        displayLarge: GoogleFonts.inter(
          fontSize: 72,
          fontWeight: FontWeight.w800,
          color: AppColors.white,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: 48,
          fontWeight: FontWeight.w700,
          color: AppColors.white,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 18,
          color: AppColors.grey,
          height: 1.6,
        ),
        
      );
}