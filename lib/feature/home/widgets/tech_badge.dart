import 'package:flutter/material.dart';
import 'package:pethan_portfolio/core/constants/app_colors.dart';
import 'package:pethan_portfolio/feature/home/widgets/glass_card.dart';

class TechBadge extends StatelessWidget {
  final Widget child;
  final double radius;

  const TechBadge({ required this.child, required this.radius, super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      radius: radius,
      padding: const EdgeInsets.all(16),
      boxDecoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.gold.withAlpha(80), width: 1.5),
        boxShadow: [
          BoxShadow(color: AppColors.gold.withAlpha(15), blurRadius: 60),
        ],
      ),
      child: child,
    );
  }
}
