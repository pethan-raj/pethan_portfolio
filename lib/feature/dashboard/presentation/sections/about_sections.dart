import 'package:flutter/material.dart';
import 'package:pethan_portfolio/core/constants/app_colors.dart';
import 'package:pethan_portfolio/core/utils/app_extensions.dart';
import '../widgets/glass_card.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 120),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Expanded(flex: 5, child: AboutLeftContent()),
          SizedBox(width: 80),
          Expanded(flex: 5, child: AboutAccordion()),
        ],
      ),
    );
  }
}

class AboutLeftContent extends StatelessWidget {
  const AboutLeftContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GlassCard(
          radius: 40,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: const Text(
            "WHO I'M",
            style: TextStyle(
              color: AppColors.gold,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        20.h,

        Text("About Myself", style: Theme.of(context).textTheme.displayMedium),

        40.h,

        Text(
          "I’m Pethanaraj — a Flutter Developer with 3+ years of experience crafting scalable and premium mobile applications for Android and iOS. From delivery apps to AI-powered products, I focus on performance, architecture, and clean user experiences.\n\nI specialize in Flutter, Dart, Kotlin, Swift, Firebase, REST APIs, and app optimization.\n\nWhether it’s building freelance products or enterprise-level applications, I turn ideas into production-ready apps.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.8),
        ),
      ],
    );
  }
}

class AboutAccordion extends StatefulWidget {
  const AboutAccordion({super.key});

  @override
  State<AboutAccordion> createState() => _AboutAccordionState();
}

class _AboutAccordionState extends State<AboutAccordion> {
  int selectedIndex = 1;

  final items = [
    {
      "title": "My History",
      "content":
          "Started with Flutter and built production-ready apps across multiple domains.",
    },
    {
      "title": "My Mission",
      "content":
          "To become a strong mobile architect and build scalable digital products.",
    },
    {
      "title": "My Vision",
      "content":
          "To master Flutter, native development, system design, and AI-driven applications.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(items.length, (index) {
        final isSelected = selectedIndex == index;

        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: AccordionCard(
            index: index,
            title: items[index]["title"]!,
            content: items[index]["content"]!,
            isSelected: isSelected,
            onTap: () {
              setState(() {
                selectedIndex = isSelected ? -1 : index;
              });
            },
          ),
        );
      }),
    );
  }
}

class AccordionCard extends StatelessWidget {
  final int index;
  final String title;
  final String content;
  final bool isSelected;
  final VoidCallback onTap;

  const AccordionCard({
    super.key,
    required this.index,
    required this.title,
    required this.content,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: GlassCard(
        radius: 28,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "0${index + 1}.",
                      style: TextStyle(
                        color: isSelected ? AppColors.gold : AppColors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    12.w,
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? AppColors.gold : AppColors.white,
                        ),
                      ),
                    ),
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.gold : AppColors.surface,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        isSelected ? Icons.close : Icons.add,
                        color: isSelected ? Colors.black : AppColors.white,
                      ),
                    ),
                  ],
                ),

                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  crossFadeState: isSelected
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Text(
                      content,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(height: 1.8),
                    ),
                  ),
                  secondChild: const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
