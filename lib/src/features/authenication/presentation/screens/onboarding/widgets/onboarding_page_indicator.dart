import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../controllers/onboarding/onboarding_provider.dart';

class OnboardingPageIndicator extends ConsumerWidget {
  const OnboardingPageIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(onboardingProvider);

    return Positioned(
      right: UDeviceUtils.getScreenWidth(context) / 2.5,
      bottom: UDeviceUtils.getScreenHeight(context) / 2.2,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < 3; i++)
            GestureDetector(
              onTap: () {
                ref.read(onboardingProvider.notifier).dotNavigationClick(i);
              },
              child: Container(
                width: 24,
                height: 4,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(56),
                  color: i == pageIndex ? UColors.white : UColors.textSecondary,
                ),
              ),
            )
        ],
      ),
    );
  }
}
