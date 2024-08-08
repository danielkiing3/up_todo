import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:up_todo/features/authenication/screens/onboarding/start.dart';

/// -- Page Controller for On-boarding screen
class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  void updatePageIndex(index) => currentPageIndex.value = index;

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }

  void backPage() {
    if (currentPageIndex.value == 0) {
      return;
    }
    currentPageIndex.value -= 1;
    pageController.jumpToPage(currentPageIndex.value);
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.to(() => const StartScreen());
    }
    currentPageIndex.value += 1;
    pageController.jumpToPage(currentPageIndex.value);
  }

  void dotNavigationClick(value) {
    currentPageIndex.value = value;
    pageController.jumpToPage(value);
  }
}
