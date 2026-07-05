import 'package:flutter/material.dart';
import 'package:pethan_portfolio/core/constants/app_assets.dart';
import 'package:pethan_portfolio/core/constants/app_strings.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectKey = GlobalKey();
  final contactKey = GlobalKey();

  int selectedIndex = 0;

  void setNavIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return;

    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
  }

  void launchURL({required String path}) {
    launchUrl(Uri.parse(path), mode: LaunchMode.externalApplication);
  }

  Future<void> launchEmail() async {
    final Uri email = Uri(
      scheme: 'mailto',
      path: AppStrings.mail,
      queryParameters: {
        'subject': 'Hello Pethanaraj',
        'body': 'Hi, I saw your portfolio.',
      },
    );

    if (!await launchUrl(email)) {
      throw Exception('Could not launch email');
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
