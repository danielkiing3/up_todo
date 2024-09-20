import 'package:flutter/material.dart';

import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/texts.dart';
import '../../../../../../utils/device/device_utility.dart';

class EmptyHomePlaceholder extends StatelessWidget {
  const EmptyHomePlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(USizes.defaultSpace),
      child: Center(
        child: Column(
          children: [
            /// -- Image
            const SizedBox(height: USizes.xl),
            Image(
              image: AssetImage(
                UImages.emptyHomeImage,
              ),
              width: UDeviceUtils.getScreenWidth(context) * 0.6,
            ),
            const SizedBox(height: USizes.md),

            /// -- Text
            Text(
              UTexts.homeEmptyTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: USizes.md),
            Text(
              UTexts.homeEmptySubtitle,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
