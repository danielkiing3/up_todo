import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';

class ProfileModal {
  static void changeAccountImage(BuildContext context) {
    showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        isScrollControlled: false,
        builder: (context) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(USizes.sm),
                color: UColors.bottomSheetPrimary,
              ),
              padding: const EdgeInsets.all(USizes.md),
              child: Column(
                children: [
                  // -- Header
                  Text(
                    'Change account Image',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: USizes.sm),

                  // -- Divider
                  const Divider(color: UColors.borderPrimary, height: 10),
                  const SizedBox(height: USizes.md),

                  // Main Content
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Take Picture'),
                      Text('Take Picture'),
                      Text('Take Picture'),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ));
  }
}
