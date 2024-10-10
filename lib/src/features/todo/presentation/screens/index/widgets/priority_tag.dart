import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../../utils/constants/colors.dart';

class PriorityTag extends StatelessWidget {
  const PriorityTag({
    super.key,
    required this.priority,
  });

  final int priority;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: UColors.buttonPrimary),
        color: Colors.transparent,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        children: [
          const Icon(
            IconsaxPlusLinear.flag,
            size: 16,
            color: Colors.white,
          ),
          const SizedBox(width: 4),
          Text(priority.toString())
        ],
      ),
    );
  }
}
