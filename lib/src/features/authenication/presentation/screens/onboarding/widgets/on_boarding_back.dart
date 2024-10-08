import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:up_todo/src/features/authenication/presentation/controllers/onboarding/onboarding_provider.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/texts.dart';

class OnboardingBack extends ConsumerWidget {
  const OnboardingBack({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      bottom: USizes.appBarHeight,
      left: USizes.defaultSpace,
      child: TextButton(
        onPressed: ref.read(onboardingProvider.notifier).backPage,
        child: Text(
          UTexts.back,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
