import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pethan_portfolio/core/constants/app_strings.dart';
import 'package:pethan_portfolio/feature/home/presentation/controller/home_controller.dart';
import 'package:provider/provider.dart';

class FollowUI extends StatelessWidget {
  const FollowUI({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = [
      FontAwesomeIcons.github,
      FontAwesomeIcons.linkedin,
      FontAwesomeIcons.instagram,
      FontAwesomeIcons.whatsapp,
    ];

    final path = [
      AppStrings.gitHub,
      AppStrings.linkedIn,
      AppStrings.instagram,
      AppStrings.whatsapp,
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: icons.asMap().entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: InkWell(
            onTap: () {
              context.read<HomeController>().launchURL(path: path[entry.key]);
            },
            child: FaIcon(entry.value, size: 24),
          ),
        );
      }).toList(),
    );
  }
}
