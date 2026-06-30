import 'package:flutter/material.dart';
import 'package:pethan_portfolio/feature/dashboard/presentation/pages/dashboard_page.dart';
import 'route_names.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardPage());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Page not found"))),
        );
    }
  }
}
