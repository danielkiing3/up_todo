import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Might not be best place to place the code

class FirstTimeOnboardingNotifier extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    final localStorage = await SharedPreferences.getInstance();

    return localStorage.getBool('USER-FIRST_TIME') ?? true;
  }

  // Helper function
  Future<bool> isFirstTime() async {
    final localStorage = await SharedPreferences.getInstance();

    return localStorage.getBool('USER-FIRST_TIME') ?? true;
  }

  Future<void> userReachStartScreen() async {
    final localStorage = await SharedPreferences.getInstance();

    await localStorage.setBool('USER-FIRST_TIME', false);
  }
}

final isFirstTimeProvider =
    AsyncNotifierProvider<FirstTimeOnboardingNotifier, bool>(
        () => FirstTimeOnboardingNotifier());

final authProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});
