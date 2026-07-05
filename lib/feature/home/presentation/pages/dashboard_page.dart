import 'package:flutter/material.dart';
import 'package:pethan_portfolio/feature/home/presentation/sections/about_sections.dart';
import 'package:pethan_portfolio/feature/home/presentation/sections/contact_sections.dart';
import 'package:pethan_portfolio/feature/home/presentation/sections/project_section.dart';
import 'package:pethan_portfolio/feature/home/widgets/nav_bar.dart';
import 'package:pethan_portfolio/feature/home/widgets/follow_ui.dart';
import 'package:provider/provider.dart';

import 'package:pethan_portfolio/core/constants/app_colors.dart';
import 'package:pethan_portfolio/feature/home/presentation/controller/home_controller.dart';
import 'package:pethan_portfolio/feature/home/presentation/sections/hero_sections.dart';
import 'package:pethan_portfolio/feature/home/presentation/sections/skill_section.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeController(),
      child: Consumer<HomeController>(
        builder: (context, controller, _) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: Stack(
              children: [
                SingleChildScrollView(
                  controller: controller.scrollController,
                  child: Column(
                    children: [
                      HeroSection(key: controller.homeKey),
                      AboutSection(key: controller.aboutKey),
                      ProjectSection(key: controller.projectKey),
                      ContactSection(key: controller.contactKey),
                    ],
                  ),
                ),

                const NavBar(),
              ],
            ),
          );
        },
      ),
    );
  }
}
