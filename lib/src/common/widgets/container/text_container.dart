import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

/// A Container with a grey background color that takes a text align at it center
class UTextContainer extends StatelessWidget {
  const UTextContainer({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: USizes.defaultSpace / 1.5),
      decoration: BoxDecoration(
        color: UColors.bottomSheetPrimary,
        borderRadius: BorderRadius.circular(USizes.borderRadius),
      ),
      child: Text(text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}
