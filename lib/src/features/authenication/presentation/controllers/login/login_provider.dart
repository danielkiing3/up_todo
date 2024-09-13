import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:up_todo/src/features/authenication/repositories(data)/auth_repository.dart';
import 'package:up_todo/src/utils/helpers/network_manager.dart';
import 'package:up_todo/src/utils/popups/network_request_popup.dart';

class LoginNotifier extends Notifier {
  @override
  build() {}

  final email = TextEditingController();
  final password = TextEditingController();

  final loginFormkey = GlobalKey<FormState>();

  Future<void> emailAndPasswordSignIn(BuildContext context) async {
    try {
      // Start the loading dialog
      UNetworkRequestPopup.openLoadingDialog(context);

      // Form Validation
      if (!loginFormkey.currentState!.validate()) {
        UNetworkRequestPopup.stopLoadingDialog(context);

        return;
      }

      // Check network connectivity
      final isConnected = ref.read(networkManagerProvider);
      if (!isConnected.hasValue) {
        UNetworkRequestPopup.stopLoadingDialog(context);
        return;
      }

      // Attempt to sign in with email and password
      await ref
          .read(authRepository)
          .signInWithEmailAndPassword(email.text.trim(), password.text.trim());
    } catch (e) {
    } finally {
      // Stop loading dialog
      // if (context.mounted) {
      //   UNetworkRequestPopup.stopLoadingDialog(context);
      // }
    }
  }

  Future<void> loginWithGoogle(BuildContext context) async {}

  Future<void> loginWithApple(BuildContext context) async {}
}

final hidePasswordLoginProvider = StateProvider.autoDispose<bool>((ref) {
  return true;
});

final loginProvider =
    NotifierProvider<LoginNotifier, void>(() => LoginNotifier());
