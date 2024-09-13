import 'package:flutter/material.dart';
import 'package:up_todo/src/utils/constants/colors.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';

class UDivider extends StatelessWidget {
  const UDivider({
    super.key,
    this.text = UTexts.or,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: USizes.sm),
            child: Divider(color: UColors.borderPrimary),
          ),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: USizes.sm),
            child: Divider(color: UColors.borderPrimary),
          ),
        ),
      ],
    );
  }
}
