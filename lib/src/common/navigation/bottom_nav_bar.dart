import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/texts.dart';
import 'bottom_nav_tab.dart';

/// -- App Bottom Navigation Bar
class UBottomNavBar extends StatelessWidget {
  const UBottomNavBar(this.navigationShell, {super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: UColors.bottomSheetPrimary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// -- Index Tab
          BottomNavTab(
            index: 0,
            label: UTexts.index,
            icon: IconsaxPlusLinear.home_2,
            activeIcon: IconsaxPlusBold.home_2,
            onTap: _onTap,
          ),

          /// -- Calender Tab
          BottomNavTab(
            index: 1,
            label: UTexts.calender,
            icon: IconsaxPlusLinear.calendar,
            activeIcon: IconsaxPlusBold.calendar,
            onTap: _onTap,
          ),

          const SizedBox(), // Placeholder for FAB to be positioned

          /// -- Focus Tab
          BottomNavTab(
            index: 2,
            label: UTexts.focus,
            icon: IconsaxPlusLinear.clock_1,
            activeIcon: IconsaxPlusBold.clock,
            onTap: _onTap,
          ),

          /// -- Profile Tab
          BottomNavTab(
            index: 3,
            label: UTexts.profile,
            icon: IconsaxPlusLinear.user,
            activeIcon: IconsaxPlusBold.user,
            onTap: _onTap,
          ),
        ],
      ),
    );
  }

  // Function to navigate to the right screen
  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
