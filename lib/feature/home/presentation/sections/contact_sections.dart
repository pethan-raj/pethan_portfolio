import 'package:flutter/material.dart';
import 'package:pethan_portfolio/core/constants/app_assets.dart';
import 'package:pethan_portfolio/core/constants/app_colors.dart';
import 'package:pethan_portfolio/core/utils/app_extensions.dart';
import 'package:pethan_portfolio/feature/home/presentation/controller/home_controller.dart';
import 'package:pethan_portfolio/feature/home/widgets/follow_ui.dart';
import 'package:provider/provider.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/custom_button.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      child: Column(
        children: [
          GlassCard(
            radius: 12,
            padding: const EdgeInsets.all(40),
            child: SizedBox(
              height: 280,
              child: Row(
                children: [
                  Expanded(flex: 4, child: ContactLeftBlock()),
                  VerticalDivider(
                    color: AppColors.border,
                    thickness: 1,
                    width: 60,
                  ),
                  Expanded(flex: 3, child: ContactCenterBlock()),
                  Expanded(flex: 3, child: ContactOrbBlock()),
                ],
              ),
            ),
          ),

          30.h,

          const FooterBottom(),
        ],
      ),
    );
  }
}

class ContactLeftBlock extends StatelessWidget {
  const ContactLeftBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: "Let's build something\n",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              TextSpan(
                text: "amazing",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: AppColors.gold,
                ),
              ),
              TextSpan(
                text: " together.",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),

        24.h,

        const Text(
          "Have a project in mind or want to discuss opportunities?\nI’m always open to discussing new ideas.",
          style: TextStyle(height: 1.7, fontSize: 18, color: AppColors.grey),
        ),

        30.h,
        Row(
          children: [
            CustomButton(
              text: "Get In Touch",
              onTap: () {
                context.read<HomeController>().launchEmail();
              },
            ),
            20.w,
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.surface,
                border: Border.all(color: AppColors.border),
              ),
              child: const Icon(Icons.mail_outline, color: AppColors.white),
            ),
          ],
        ),
      ],
    );
  }
}

class ContactCenterBlock extends StatelessWidget {
  const ContactCenterBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        ContactRow(Icons.mail_outline, "pethanaraj.sp@gmail.com"),
        SizedBox(height: 28),
        ContactRow(Icons.phone_outlined, "+91 63833 04308"),
        SizedBox(height: 28),
        ContactRow(Icons.location_on_outlined, "Chennai, India"),
        SizedBox(height: 28),
        ContactRow(Icons.public, "Available", isActive: true),
      ],
    );
  }
}

class ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isActive;

  const ContactRow(this.icon, this.text, {super.key, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.white),
        16.w,
        if (isActive)
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
          ),
        if (isActive) 8.w,
        Text(text, style: const TextStyle(fontSize: 18)),
      ],
    );
  }
}

class ContactOrbBlock extends StatelessWidget {
  const ContactOrbBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.gold.withAlpha(45),
                  blurRadius: 50,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: Image.asset(AppAssets.pfIcon),
          ),
          SizedBox(height: 28),
          FollowUI(),
        ],
      ),
    );
  }
}

class FooterBottom extends StatelessWidget {
  const FooterBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          "© 2026 All rights reserved.",
          style: TextStyle(color: AppColors.grey),
        ),
        Spacer(),
        Row(
          children: [
            Text(
              "Designed & Built with ",
              style: TextStyle(color: AppColors.grey),
            ),
            Icon(Icons.favorite, color: AppColors.gold, size: 18),
            SizedBox(width: 6),
            Text("Flutter", style: TextStyle(color: AppColors.white)),
          ],
        ),
      ],
    );
  }
}
