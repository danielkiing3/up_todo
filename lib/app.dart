import 'package:flutter/material.dart';
import 'package:up_todo/src/utils/routing/route_config.dart';
import 'package:up_todo/src/utils/theme/theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.dark,
      theme: UAppTheme.appTheme,
      routerConfig: router,
    );
  }
}
