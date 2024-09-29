import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class UActionChip extends StatelessWidget {
  const UActionChip({
    super.key,
    required this.onTap,
    required this.content,
  });

  final VoidCallback onTap;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: UColors.white.withOpacity(0.21),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: content,
      ),
    );
  }
}
