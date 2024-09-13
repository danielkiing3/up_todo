import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/texts.dart';
import '../../../controllers/onboarding/onboarding_provider.dart';

class OnBoardingNext extends ConsumerWidget {
  const OnBoardingNext({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(onboardingProvider);

    return Positioned(
      bottom: USizes.appBarHeight,
      right: USizes.defaultSpace,
      child: ElevatedButton(
        onPressed: () =>
            ref.read(onboardingProvider.notifier).nextPage(context),
        child: Text(pageIndex == 2 ? UTexts.getStarted : UTexts.next),
      ),
    );
  }
}
