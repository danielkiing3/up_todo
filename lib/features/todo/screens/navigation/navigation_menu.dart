import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/navigation/navigation_controller.dart';
import 'widgets/bottom_nav_bar.dart';
import 'widgets/nav_floating_action_button.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationMenuController());

    return Scaffold(
      floatingActionButton: const UNavFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const UBottomNavBar(),
      body: Obx(() => controller.screen[controller.currentPageIndex.value]),
    );
  }
}
