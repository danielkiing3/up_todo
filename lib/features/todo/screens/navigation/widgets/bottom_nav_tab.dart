import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/navigation/navigation_controller.dart';

class BottomNavTab extends StatelessWidget {
  const BottomNavTab({
    super.key,
    required this.index,
    required this.label,
    required this.activeIcon,
    required this.icon,
  });

  final int index;
  final String label;
  final IconData activeIcon;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final controller = NavigationMenuController.instance;

    return GestureDetector(
      onTap: () {
        controller.updateIndex(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
            () => Icon(
                controller.currentPageIndex.value == index ? activeIcon : icon),
          ),
          const SizedBox(height: USizes.sm),
          Text(label)
        ],
      ),
    );
  }
}
