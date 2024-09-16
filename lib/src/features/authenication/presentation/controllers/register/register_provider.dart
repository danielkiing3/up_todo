import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/src/utils/constants/routes.dart';
import 'package:up_todo/src/utils/popups/snackbar_popup.dart';

import '../../../../../utils/helpers/network_manager.dart';
import '../../../../../utils/popups/network_request_popup.dart';
import '../../../repositories(data)/auth_repository.dart';

class RegisterNotifier extends Notifier {
  @override
  build() {}

  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  final registerFormkey = GlobalKey<FormState>();

  Future<void> emailAndPasswordRegister(BuildContext context) async {
    //TODO: Lot of clean up to be done
    try {
      // Start the loading dialog
      UNetworkRequestPopup.openLoadingDialog(context);

      // Form Validation
      if (!registerFormkey.currentState!.validate()) {
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
      await ref.read(authRepository).registerInWithEmailAndPassword(
          email.text.trim(), password.text.trim());

      // Stop Popup
      if (context.mounted) {
        USnackBarPopup.sucessSnackBar(context,
            title: 'Congrats', message: 'User succesffuly created');
        UNetworkRequestPopup.stopLoadingDialog(context);
        context.goNamed(URoutes.homeScreen);
      }
    } catch (e) {
      if (context.mounted) {
        UNetworkRequestPopup.stopLoadingDialog(context);
        USnackBarPopup.errorSnackBar(context,
            message: e.toString(), title: 'Oh Snap!');
      }
    }
  }

  Future<void> registerWithGoogle(BuildContext context) async {
    try {
      // Start the loading dialog
      UNetworkRequestPopup.openLoadingDialog(context);

      // Check network connectivity
      final isConnected = ref.read(networkManagerProvider);
      if (!isConnected.hasValue) {
        UNetworkRequestPopup.stopLoadingDialog(context);
        return;
      }

      // Attempt to sign in with email and password
      await ref.read(authRepository).signInWithGoogle();

      //TODO: Save user record

      // Stop Popup
      if (context.mounted) {
        USnackBarPopup.sucessSnackBar(context,
            title: 'Congrats', message: 'User succesffuly created');
        UNetworkRequestPopup.stopLoadingDialog(context);
        context.goNamed(URoutes.homeScreen);
      }
    } catch (e) {
      if (context.mounted) {
        UNetworkRequestPopup.stopLoadingDialog(context);
        USnackBarPopup.errorSnackBar(context,
            message: e.toString(), title: 'Oh Snap!');
      }
    }
  }

  Future<void> registerWithApple() async {}
}

final hidePasswordRegsiterProvider = StateProvider.autoDispose<bool>((ref) {
  return true;
});

final hideConfirmPasswordRegsiterProvider =
    StateProvider.autoDispose<bool>((ref) {
  return true;
});

final registerProvider =
    NotifierProvider<RegisterNotifier, void>(() => RegisterNotifier());
