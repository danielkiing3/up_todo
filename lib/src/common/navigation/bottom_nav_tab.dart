import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/constants/sizes.dart';
import 'controller/navigation_controller.dart';

/// -- Widget for each bottom navgation tab element
class BottomNavTab extends ConsumerWidget {
  const BottomNavTab(
      {super.key,
      required this.index,
      required this.label,
      required this.activeIcon,
      required this.icon,
      required this.onTap});

  final int index;
  final String label;
  final IconData activeIcon;
  final IconData icon;
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(bottomNavigationProvider);

    return GestureDetector(
      onTap: () {
        onTap(index);
        ref.read(bottomNavigationProvider.notifier).state = index;
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(controller == index ? activeIcon : icon),
            const SizedBox(height: USizes.sm),
            Text(label)
          ],
        ),
      ),
    );
  }
}
