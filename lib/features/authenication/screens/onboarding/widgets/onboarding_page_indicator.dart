import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class OnboardingPageIndicator extends StatelessWidget {
  const OnboardingPageIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;

    return Positioned(
      right: UDeviceUtils.getScreenWidth() / 2.5,
      bottom: UDeviceUtils.getScreenHeight() / 2.2,
      child: Obx(
        () => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < 3; i++)
              GestureDetector(
                onTap: () {
                  controller.dotNavigationClick(i);
                },
                child: Container(
                  width: 24,
                  height: 4,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(56),
                    color: i == controller.currentPageIndex.value
                        ? UColors.white
                        : UColors.textSecondary,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
