import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:up_todo/features/authenication/controllers/onboarding/onboarding_controller.dart';
import 'package:up_todo/features/authenication/screens/onboarding/widgets/on_boarding_back.dart';
import 'package:up_todo/features/authenication/screens/onboarding/widgets/on_boarding_next.dart';
import 'package:up_todo/features/authenication/screens/onboarding/widgets/on_boarding_page.dart';
import 'package:up_todo/features/authenication/screens/onboarding/widgets/on_boarding_skip.dart';
import 'package:up_todo/utils/constants/image_strings.dart';
import 'package:up_todo/utils/constants/texts.dart';

import 'widgets/onboarding_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(OnboardingController()); //TODO: Replace with binding

    return Scaffold(
      body: Stack(
        children: [
          /// -- Scrollable Widget
          PageView(
            onPageChanged: controller.updatePageIndex,
            controller: controller.pageController,
            children: [
              OnboardingPage(
                title: UTexts.onBoardingTitle1,
                subtitle: UTexts.onBoardingSubtitle1,
                image: UImages.onBoardingImage1,
              ),
              OnboardingPage(
                title: UTexts.onBoardingTitle2,
                subtitle: UTexts.onBoardingSubtitle2,
                image: UImages.onBoardingImage2,
              ),
              OnboardingPage(
                title: UTexts.onBoardingTitle3,
                subtitle: UTexts.onBoardingSubtitle3,
                image: UImages.onBoardingImage3,
              ),
            ],
          ),

          /// -- Page Indicator
          const OnboardingPageIndicator(),

          /// -- SKIP Button
          const OnboardingSkip(),

          /// -- Back Button
          const OnboardingBack(),

          /// -- Next Button
          const OnBoardingNext(),
        ],
      ),
    );
  }
}
