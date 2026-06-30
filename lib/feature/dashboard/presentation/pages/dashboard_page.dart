import 'package:flutter/material.dart';
import 'package:pethan_portfolio/core/constants/app_colors.dart';
import 'package:pethan_portfolio/feature/dashboard/presentation/sections/about_sections.dart';
import 'package:pethan_portfolio/feature/dashboard/presentation/sections/contact_sections.dart';
import 'package:pethan_portfolio/feature/dashboard/presentation/sections/hero_sections.dart';
import 'package:pethan_portfolio/feature/dashboard/presentation/sections/skill_section.dart';
import 'package:pethan_portfolio/feature/dashboard/presentation/widgets/nav_bar.dart';
import 'package:pethan_portfolio/feature/dashboard/presentation/widgets/social_sidebar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SocialSidebar(),
          NavBar(),
          SingleChildScrollView(
            child: Column(
              children: const [
                HeroSection(),
                AboutSection(),
                SkillsSection(),
                ContactSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
