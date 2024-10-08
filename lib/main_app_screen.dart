import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'src/common/navigation/bottom_nav_bar.dart';
import 'src/common/navigation/nav_floating_action_button.dart';

/// -- App Main Navigation Menu
class MainAppScreen extends StatelessWidget {
  const MainAppScreen(this.navigationShell, {super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: const UNavFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: UBottomNavBar(navigationShell),
        body: navigationShell,
      ),
    );
  }
}
