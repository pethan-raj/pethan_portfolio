import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pethan_portfolio/core/constants/app_colors.dart';
import 'package:provider/provider.dart';

import 'package:pethan_portfolio/core/constants/app_assets.dart';
import 'package:pethan_portfolio/core/theme/app_decoration.dart';
import 'package:pethan_portfolio/core/utils/app_spacing.dart';
import 'package:pethan_portfolio/feature/home/presentation/controller/home_controller.dart';
import 'package:pethan_portfolio/feature/home/widgets/custom_button.dart';
import 'package:pethan_portfolio/feature/home/widgets/flash_button.dart';
import 'package:pethan_portfolio/feature/home/widgets/glass_card.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();

    final items = ["Home", "About", "Resume", "Projects", "Contact"];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AppAssets.pfIcon, height: 50),

          ClipRRect(
            borderRadius: BorderRadius.circular(200),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                padding: EdgeInsets.all(AppSpacing.s),
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(200),
                  border: Border.all(color: Colors.white12),
                ),
                child: Row(
                  children: items.asMap().entries.map((entry) {
                    final index = entry.key;
                    final item = entry.value;

                    final isSelected = controller.selectedIndex == index;

                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 0 : AppSpacing.s,
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),

                        onTap: () {
                          final controller = context.read<HomeController>();

                          controller.setNavIndex(index);

                          switch (index) {
                            case 0:
                              controller.scrollToSection(controller.homeKey);
                              break;

                            case 1:
                              controller.scrollToSection(controller.aboutKey);
                              break;

                            case 2:
                              controller.launchURL(path: AppAssets.resume);
                              break;

                            case 3:
                              controller.scrollToSection(controller.projectKey);
                              break;

                            case 4:
                              controller.scrollToSection(controller.contactKey);
                              break;
                          }
                        },
                        child: FlashButton(
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeOut,
                            child: GlassCard(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              boxDecoration: isSelected
                                  ? AppDecoration.glassDecoration()
                                  : BoxDecoration(),
                              child: AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 250),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                  color: isSelected
                                      ? AppColors.gold
                                      : AppColors.white,
                                ),
                                child: Text(item),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 48,
            child: CustomButton(
              text: "Hire Me",
              type: ButtonType.filled,
              onTap: () async {
                await controller.launchEmail();
              },
            ),
          ),
        ],
      ),
    );
  }
}
