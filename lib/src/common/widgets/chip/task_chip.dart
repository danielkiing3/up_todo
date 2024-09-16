import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class UTaskChip extends StatelessWidget {
  const UTaskChip({
    super.key,
    required this.chipName,
    required this.iconData,
    required this.onTap,
  });

  final String chipName;
  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: ActionChip(
        backgroundColor: UColors.primary,
        avatar: Icon(iconData, color: Colors.white),
        label: Row(
          children: [
            Text(chipName),
            const SizedBox(width: USizes.xs),
            const Icon(Icons.cancel, size: 15)
          ],
        ),
        onPressed: onTap,
      ),
    );
  }
}
