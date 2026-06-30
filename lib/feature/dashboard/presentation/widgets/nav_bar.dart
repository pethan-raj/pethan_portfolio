import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pethan_portfolio/core/animations/fade_animation.dart';
import 'package:pethan_portfolio/core/animations/hover_scale_animation.dart';
import 'package:pethan_portfolio/core/constants/app_assets.dart';
import 'package:pethan_portfolio/core/theme/app_decoration.dart';
import 'package:pethan_portfolio/core/utils/app_spacing.dart';
import 'package:pethan_portfolio/feature/dashboard/presentation/widgets/custom_button.dart';
import 'glass_card.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    final items = ["Home", "About", "Resume", "Projects", "Contact"];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AppAssets.pfIcon, height: 50),

          HoverScale(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(200),
                    border: Border.all(color: Colors.white12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        blurRadius: 32,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(AppSpacing.s),
                  child: Row(
                    children: [
                      ...items.map(
                        (item) => InkWell(
                          // onHover: (value) => _onNavHover = value,
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: items.first == item ? 0 : AppSpacing.s,
                            ),
                            child: GlassCard(
                              padding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              boxDecoration:
                                  AppDecoration.yelloGlassDecoration(),

                              child: Text(item),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 48,
            child: CustomButton(text: 'Hire Me', onTap: () {}).fadeIn(),
          ),
        ],
      ),
    );
  }
}



// border: Border.all(
                    //   color: AppColors.gold.withAlpha(30),
                    //   width: 1.5,
                    // ),
                    // borderRadius: BorderRadius.circular(200),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: AppColors.gold.withAlpha(40),
                    //     blurRadius: 40,
                    //     spreadRadius: 2,
                    //   ),
                    // ],