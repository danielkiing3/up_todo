import 'package:flutter/material.dart';
import 'package:up_todo/common/widgets/texts/section_heading.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';

/// -- Onboarding Page Widget Builder
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  final String title, subtitle, image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(USizes.defaultSpace),
      child: Column(
        children: [
          /// -- Image
          Image(
            image: AssetImage(image),
            width: UDeviceUtils.getScreenWidth() * 0.8,
            height: UDeviceUtils.getScreenHeight() * 0.55,
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
    );
  }
}
