import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pethan_portfolio/core/animations/floating_y_animation.dart';
import 'package:pethan_portfolio/core/animations/slide_up_animation.dart';
import 'package:pethan_portfolio/core/constants/app_assets.dart';
import 'package:pethan_portfolio/core/constants/app_colors.dart';
import 'package:pethan_portfolio/core/theme/app_decoration.dart';
import 'package:pethan_portfolio/core/utils/app_extensions.dart';
import 'package:pethan_portfolio/core/utils/app_responsice.dart';
import 'package:pethan_portfolio/feature/home/presentation/controller/home_controller.dart';
import 'package:pethan_portfolio/feature/home/widgets/custom_button.dart';
import 'package:pethan_portfolio/feature/home/widgets/glass_card.dart';
import 'package:pethan_portfolio/feature/home/widgets/tech_badge.dart';
import 'package:provider/provider.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppResponsive.isMobile(context);
    final isTab = AppResponsive.isTablet(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          80.h,
          isMobile || isTab
              ? Column(children: [HeroLeft(), 40.h, HeroRight()])
              : const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(flex: 6, child: HeroLeft()),
                    Expanded(flex: 4, child: HeroRight()),
                  ],
                ).slideUp(),
        ],
      ),
    );
  }
}

class HeroLeft extends StatelessWidget {
  const HeroLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        72.h,
        Row(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [_infoText(context), _nameText(context)],
        ),

        40.h,

        AnimatedTextKit(
          repeatForever: false,
          animatedTexts: [
            TypewriterAnimatedText(
              "Senior Flutter Developer | Mobile Architect",
              textStyle: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ).slideUp(),

        12.h,

        SizedBox(
          // width: 500,
          child: Text(
            "Crafting premium mobile experiences with Flutter and Kotlin Android. Building scalable, performant and aesthetic applications.",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ).slideUp(),

        80.h,

        Row(
          children: [
            CustomButton(
              text: "Hire Me",
              onTap: () {
                context.read<HomeController>().launchEmail();
              },
            ),
            16.w,
            CustomButton(
              text: "Resume",
              onTap: () {
                context.read<HomeController>().launchURL(
                  path: AppAssets.resume,
                );
              },
              type: ButtonType.outline,
            ),
          ],
        ).slideUp(),
        20.h,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.green,
                    spreadRadius: 0.8,
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
            12.w,
            Text(
              'Available for new opportunities',
              style: TextStyle(fontSize: 12, color: AppColors.white),
            ),
          ],
        ).slideUp(),
      ],
    );
  }

  Widget _infoText(BuildContext context) {
    return Text(
      "Hi, This is",
      style: Theme.of(context).textTheme.displayMedium,
    ).slideUp();
  }

  Widget _nameText(BuildContext context) {
    return FloatingY(
      child: Transform.rotate(
        angle: -0.03,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Pethanaraj",
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  // color: AppColors.background,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2
                    ..color = AppColors.gold,
                ),
              ),
              WidgetSpan(child: 12.w),
              TextSpan(
                text: "S",
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2
                    ..color = AppColors.white,
                ),
              ),
            ],
          ),
        ).slideUp(),
      ),
    );
  }
}

class HeroRight extends StatelessWidget {
  const HeroRight({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 380,
            height: 380,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.gold, width: 1.5),
              boxShadow: [
                BoxShadow(color: AppColors.gold.withAlpha(15), blurRadius: 80),
              ],
            ),
          ),

          FloatingY(
            child: CircleAvatar(
              radius: 160,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(AppAssets.pfIcon),
            ),
          ),

          Positioned(
            top: 12,
            left: 40,
            child: FloatingY(
              child: TechBadge(
                radius: 24,
                child: Text(
                  '<',
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 12,
            right: 30,
            child: FloatingY(
              child: TechBadge(
                radius: 24,
                child: Text(
                  '/>',
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 2,
            right: 40,
            child: FloatingY(
              child: TechBadge(
                radius: 24,
                child: Center(
                  child: FaIcon(FontAwesomeIcons.android, size: 18),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            left: 20,
            child: FloatingY(
              child: TechBadge(
                radius: 24,
                child: Center(child: FaIcon(FontAwesomeIcons.apple, size: 18)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeroStats extends StatelessWidget {
  const HeroStats({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      boxDecoration: AppDecoration.glassDecoration(radius: 32),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 32,
        children: [
          StatItem(
            number: _calculateYear(),
            label: "Years Exp.",
            faIcon: FontAwesomeIcons.briefcase,
          ),
          StatItem(
            number: "6+",
            label: "Applicaions",
            faIcon: FontAwesomeIcons.mobileScreen,
          ),
          StatItem(
            number: "3+",
            label: "Web Apps",
            faIcon: FontAwesomeIcons.desktop,
          ),
        ],
      ),
    );
  }

  String _calculateYear() {
    DateTime startDate = DateTime(2022, 12, 1);
    DateTime now = DateTime.now();
    double totalYears = now.difference(startDate).inDays / 365.25;
    return totalYears.toStringAsFixed(1);
  }
}

class StatItem extends StatelessWidget {
  final String number;
  final String? label;
  final FaIconData faIcon;

  const StatItem({
    super.key,
    required this.number,
    this.label,
    required this.faIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GlassCard(
          radius: 200,
          boxDecoration: AppDecoration.yelloGlassDecoration(radius: 200),
          child: SizedBox(
            height: 32,
            width: 32,
            child: Center(
              child: FaIcon(faIcon, color: AppColors.white, size: 32),
            ),
          ),
        ),
        12.w,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              number,
              style: TextStyle(
                color: AppColors.gold,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (label != null) Text(label!),
          ],
        ),
      ],
    );
  }
}
