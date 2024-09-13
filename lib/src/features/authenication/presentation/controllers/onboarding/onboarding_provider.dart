import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/src/utils/constants/routes.dart';
// import 'package:up_todo/src/features/authenication/presentation/screens/onboarding/start.dart';

// Notifier class to handle onboarding logic
class OnboardingNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  // Page controller for the onboarding
  final pageController = PageController();

  void updatePageIndex(index) => state = index;

  void skipPage() {
    state = 2;
    pageController.jumpToPage(2);
  }

  void backPage() {
    if (state == 0) {
      return;
    }
    state = state - 1;
    pageController.jumpToPage(state);
  }

  void nextPage(BuildContext context) {
    if (state == 2) {
      context.goNamed(URoutes.startScreen);
      return;
    }
    state = state + 1;
    pageController.jumpToPage(state);
  }

  void dotNavigationClick(value) {
    state = value;
    pageController.jumpToPage(value);
  }
}

final onboardingProvider =
    NotifierProvider<OnboardingNotifier, int>(() => OnboardingNotifier());
