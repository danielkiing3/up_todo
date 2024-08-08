import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:up_todo/features/authenication/screens/onboarding/on_boarding.dart';
import 'package:up_todo/utils/theme/theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.dark,
      theme: UAppTheme.appTheme,
      home: const OnBoardingScreen(),
    );
  }
}
