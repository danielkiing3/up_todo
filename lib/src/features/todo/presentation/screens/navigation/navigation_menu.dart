import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/navigation/navigation_controller.dart';
import 'widgets/bottom_nav_bar.dart';
import 'widgets/nav_floating_action_button.dart';

/// -- App Main Navigation Menu
class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
        NavigationMenuController()); // Initialization of the Navigation controller

    return Scaffold(
      resizeToAvoidBottomInset: false, // fluter 2.x
      floatingActionButton:
          const UNavFloatingActionButton(), // Floating Action Button for Modal overlay

      // Ensure the FAB is docked at the center
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Bottom Navigation
      bottomNavigationBar: const UBottomNavBar(),

      // Body that reactive to the [controller.currentPageIndex] to update state
      body: Obx(() => controller.screen[controller.currentPageIndex.value]),
    );
  }
}
