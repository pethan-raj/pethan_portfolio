import 'package:flutter/material.dart';
import 'package:pethan_portfolio/core/constants/app_assets.dart';
import 'package:pethan_portfolio/core/constants/app_colors.dart';
import 'package:pethan_portfolio/core/theme/app_decoration.dart';
import '../../widgets/glass_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      AppAssets.flutter,
      AppAssets.dart,
      AppAssets.firebase,
      AppAssets.kotlin,
      AppAssets.jetpack,
      AppAssets.java,
      AppAssets.spring,
      AppAssets.git,
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: GlassCard(
        radius: 12,
        padding: const EdgeInsets.all(24),
        boxDecoration: AppDecoration.glassDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(Icons.circle_outlined, color: AppColors.gold, size: 24),
                SizedBox(width: 10),
                Text(
                  "Core Technologies",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ],
            ),

            SizedBox(
              height: 180,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const OrbitGlow(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: skills.map((skill) {
                      return SkillBubble(value: skill);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrbitGlow extends StatelessWidget {
  const OrbitGlow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 140,
      child: CustomPaint(painter: OrbitPainter()),
    );
  }
}

class OrbitPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final rings = [
      {'w': size.width * 0.95, 'h': size.height * 0.75, 'opacity': 10},
      {'w': size.width * 0.75, 'h': size.height * 0.55, 'opacity': 15},
      {'w': size.width * 0.50, 'h': size.height * 0.32, 'opacity': 20},
    ];

    for (final ring in rings) {
      final paint = Paint()
        ..color = Color(0xFFF4C542).withAlpha(ring['opacity'] as int)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2;

      final rect = Rect.fromCenter(
        center: center,
        width: ring['w'] as double,
        height: ring['h'] as double,
      );

      canvas.drawOval(rect, paint);
    }

    // Glow effect
    final glowPaint = Paint()
      ..color = const Color(0xFFF4C542).withOpacity(0.08)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 40);

    canvas.drawOval(
      Rect.fromCenter(
        center: center,
        width: size.width * 0.95,
        height: size.height * 0.75,
      ),
      glowPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class SkillBubble extends StatefulWidget {
  final String value;

  const SkillBubble({super.key, required this.value});

  @override
  State<SkillBubble> createState() => _SkillBubbleState();
}

class _SkillBubbleState extends State<SkillBubble> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => isHover = true);
      },
      onExit: (_) {
        setState(() => isHover = false);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.glass,
          border: Border.all(
            color: isHover ? AppColors.gold : AppColors.gold.withAlpha(20),
            width: 1.2,
          ),
          boxShadow: [
            if (isHover)
              BoxShadow(
                color: AppColors.gold.withAlpha(120),
                blurRadius: 30,
                spreadRadius: 3,
              ),
          ],
        ),
        child: Center(
          child: widget.value.contains("assets")
              ? Image.asset(widget.value, width: 38)
              : Text(
                  widget.value,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }
}
