import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:up_todo/features/authenication/controllers/onboarding/onboarding_controller.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class OnBoardingNext extends StatelessWidget {
  const OnBoardingNext({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;

    return Positioned(
      bottom: USizes.appBarHeight,
      right: USizes.defaultSpace,
      child: ElevatedButton(
        onPressed: controller.nextPage,
        child: Obx(
          () => Text(controller.currentPageIndex.value == 2
              ? UTexts.getStarted
              : UTexts.next),
        ),
      ),
    );
  }
}
