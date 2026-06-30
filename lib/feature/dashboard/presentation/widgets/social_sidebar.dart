import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialSidebar extends StatelessWidget {
  const SocialSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = [
      FontAwesomeIcons.github,
      FontAwesomeIcons.linkedin,
      FontAwesomeIcons.instagram,
    ];

    return Positioned(
      left: 30,
      top: MediaQuery.sizeOf(context).height * 0.4,
      child: Column(
        children: icons.map((icon) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: FaIcon(icon, size: 20),
          );
        }).toList(),
      ),
    );
  }
}
