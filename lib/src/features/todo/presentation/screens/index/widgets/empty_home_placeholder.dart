import 'package:flutter/material.dart';
import 'package:up_todo/src/common/widgets/shimmers/animated_shimmer.dart';
import 'package:up_todo/src/common/widgets/shimmers/shimmer_container.dart';

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

/// Shimmer effect for home loading state
class HomeLoadingPlaceholder extends StatelessWidget {
  const HomeLoadingPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AnimatedShimmer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            ShimmerContainer(isSmall: true),
            ShimmerContainer(),
            ShimmerContainer(),
            SizedBox(height: 20),
            ShimmerContainer(isSmall: true),
            ShimmerContainer(),
            ShimmerContainer(),
          ],
        ),
      ),
    );
  }
}
