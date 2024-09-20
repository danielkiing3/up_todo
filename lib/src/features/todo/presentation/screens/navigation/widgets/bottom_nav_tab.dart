import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../controllers/navigation/navigation_controller.dart';

/// -- Widget for each bottom navgation tab element
class BottomNavTab extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(bottomNavigationProvider);

    return GestureDetector(
      onTap: () {
        ref.read(bottomNavigationProvider.notifier).state = index;
        // Update the current index in the Navigation controller instance
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(controller == index ? activeIcon : icon),
          const SizedBox(height: USizes.sm),
          Text(label)
        ],
      ),
    );
  }
}
