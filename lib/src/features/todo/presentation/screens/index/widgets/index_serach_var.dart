import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:up_todo/src/utils/constants/sizes.dart';
import 'package:up_todo/src/utils/constants/texts.dart';

import '../../../../../../utils/constants/colors.dart';

/// Custom search bar for the index page
class IndexSearchBar extends StatelessWidget {
  const IndexSearchBar({
    super.key,
    required this.onTap,
  });

  // Callback for the gesture detector
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: USizes.spaceBtwSections,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: UColors.borderPrimary),
            borderRadius: BorderRadius.circular(USizes.sm),
            color: UColors.darkestGrey,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: USizes.smallDefaultSpace,
            vertical: USizes.buttonHeight,
          ),
          child: Row(
            children: [
              Icon(
                IconsaxPlusLinear.search_normal,
                color: UColors.textSecondary,
                size: 30,
              ),
              const SizedBox(width: USizes.smallDefaultSpace),
              Text(
                UTexts.searchForTask,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: UColors.textSecondary),
              )
            ],
          ),
        ),
      ),
    );
  }
}
