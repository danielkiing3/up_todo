import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../personalization/screens/profile/profile.dart';
import '../../controllers/navigation/navigation_controller.dart';
import '../calender/calender.dart';
import '../focus/focus.dart';
import '../index/index.dart';
import 'widgets/bottom_nav_bar.dart';
import 'widgets/nav_floating_action_button.dart';

/// -- App Main Navigation Menu
class NavigationMenu extends ConsumerWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(bottomNavigationProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false, // fluter 2.x
      floatingActionButton:
          const UNavFloatingActionButton(), // Floating Action Button for Modal overlay

      // Ensure the FAB is docked at the center
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Bottom Navigation
      bottomNavigationBar: const UBottomNavBar(),

      // Body that reactive to the [controller.currentPageIndex] to update state
      body: [
        const IndexScreen(),
        const CalenderScreen(),
        const FocusScreen(),
        const ProfileScreen(),
      ][pageIndex],
    );
  }
}
