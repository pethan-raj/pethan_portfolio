import 'package:flutter/material.dart';
import 'package:pethan_portfolio/core/constants/keys.dart';
import 'package:pethan_portfolio/core/router/app_router.dart';
import 'package:pethan_portfolio/core/router/route_names.dart';
import 'package:pethan_portfolio/core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: AppTheme.darkTheme,
      initialRoute: RouteNames.dashboard,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}