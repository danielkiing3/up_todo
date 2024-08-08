import 'package:flutter/material.dart';
import 'package:up_todo/features/authenication/controllers/onboarding/onboarding_controller.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class OnboardingBack extends StatelessWidget {
  const OnboardingBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;

    return Positioned(
      bottom: USizes.appBarHeight,
      left: USizes.defaultSpace,
      child: TextButton(
        onPressed: controller.backPage,
        child: const Text(UTexts.back),
      ),
    );
  }
}
