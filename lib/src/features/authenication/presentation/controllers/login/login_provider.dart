import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/src/features/authenication/repositories/auth_repository.dart';
import 'package:up_todo/src/utils/helpers/network_manager.dart';
import 'package:up_todo/src/utils/popups/network_request_popup.dart';

import '../../../../../utils/constants/routes.dart';
import '../../../../../utils/popups/snackbar_popup.dart';

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

      //TODO; Something wrong with the networ manager
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

      // Stop Popup
      if (context.mounted) {
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

  Future<void> loginWithGoogle(BuildContext context) async {
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

  Future<void> loginWithApple(BuildContext context) async {
    try {
      // Start the loading dialog
      UNetworkRequestPopup.openLoadingDialog(context);

      // Check network connectivity
      final isConnected = ref.read(networkManagerProvider);
      if (!isConnected.hasValue) {
        UNetworkRequestPopup.stopLoadingDialog(context);
        return;
      }

      //TODO: Apple sign here

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
}

final hidePasswordLoginProvider = StateProvider.autoDispose<bool>((ref) {
  return true;
});

final loginProvider =
    NotifierProvider<LoginNotifier, void>(() => LoginNotifier());
