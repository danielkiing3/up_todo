import 'package:flutter/material.dart';
import 'package:up_todo/src/common/widgets/texts/section_heading.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/device/device_utility.dart';

/// -- Onboarding Page Widget Builder
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.isImageLarge = false,
  });

  final String title, subtitle, image;
  final bool isImageLarge;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(USizes.defaultSpace),
      child: Center(
        child: Column(
          children: [
            /// -- Image
            Image(
              image: AssetImage(image),
              width:
                  isImageLarge // If Image size is large, the width of the screen is reduced
                      ? UDeviceUtils.getScreenWidth(context) * 0.7
                      : UDeviceUtils.getScreenWidth(context) * 0.8,
              height: UDeviceUtils.getScreenHeight(context) * 0.55,
            ),

            /// -- Title
            USectionHeading(title: title),
            const SizedBox(height: USizes.bigSpaceBtwSections),

            /// -- Subtitle
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
