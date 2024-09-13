import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:up_todo/src/utils/constants/image_strings.dart';
import 'package:up_todo/src/utils/constants/texts.dart';

import '../../controllers/onboarding/onboarding_provider.dart';
import 'widgets/on_boarding_back.dart';
import 'widgets/on_boarding_next.dart';
import 'widgets/on_boarding_page.dart';
import 'widgets/on_boarding_skip.dart';
import 'widgets/onboarding_page_indicator.dart';

class OnBoardingScreen extends ConsumerWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController =
        ref.watch(onboardingProvider.notifier).pageController;

    return Scaffold(
      body: Stack(
        children: [
          /// -- Scrollable Widget
          PageView(
            onPageChanged:
                ref.read(onboardingProvider.notifier).updatePageIndex,
            controller: pageController,
            children: [
              OnboardingPage(
                title: UTexts.onBoardingTitle1,
                subtitle: UTexts.onBoardingSubtitle1,
                image: UImages.onBoardingImage1,
                isImageLarge: true,
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
