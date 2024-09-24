import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../../utils/constants/colors.dart';

class IndexDropdownChip extends StatelessWidget {
  const IndexDropdownChip({
    super.key,
    required this.name,
    required this.onTap,
  });

  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: UColors.white.withOpacity(0.21),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(name),
            const SizedBox(width: 10),
            const Icon(IconsaxPlusLinear.arrow_down, size: 16),
          ],
        ),
      ),
    );
  }
}
