import 'package:flutter/material.dart';
import 'package:up_todo/features/authenication/controllers/onboarding/onboarding_controller.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;

    return Positioned(
      top: USizes.appBarHeight,
      left: USizes.defaultSpace,
      child: TextButton(
        onPressed: controller.skipPage,
        child: const Text(UTexts.skip),
      ),
    );
  }
}
