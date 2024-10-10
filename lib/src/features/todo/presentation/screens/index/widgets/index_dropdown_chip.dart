import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:up_todo/src/utils/constants/sizes.dart';

import '../../../../../../utils/constants/colors.dart';

class IndexDropdownChip extends StatelessWidget {
  const IndexDropdownChip({
    super.key,
    required this.name,
    required this.onTap,
    required this.visible,
  });

  final String name;
  final bool visible;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: USizes.spaceBtwItems,
        bottom: USizes.defaultSpace,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(USizes.sm),
              color: UColors.white.withOpacity(0.21),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(name),
                const SizedBox(width: 10),
                Icon(
                    visible
                        ? IconsaxPlusLinear.arrow_down
                        : IconsaxPlusLinear.arrow_up_1,
                    size: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
