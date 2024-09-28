import 'package:flutter/material.dart';

import '../../../../../../utils/constants/sizes.dart';

class EditTaskRow extends StatelessWidget {
  const EditTaskRow({
    super.key,
    required this.icon,
    required this.name,
    this.actionChip,
  });

  final IconData icon;
  final String name;
  final Widget? actionChip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: USizes.defaultSpace),
      child: Row(
        children: [
          const SizedBox(width: USizes.smallSpaceBtwItems),
          Icon(icon),
          const SizedBox(width: USizes.smallSpaceBtwItems),
          Text(name),
          const Spacer(),
          if (actionChip != null) actionChip!
        ],
      ),
    );
  }
}
