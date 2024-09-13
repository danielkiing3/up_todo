import 'package:flutter/material.dart';
import 'package:up_todo/src/utils/constants/colors.dart';

class UNetworkRequestPopup {
  UNetworkRequestPopup._();

  static void openLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return PopScope(
          canPop:
              false, // Prevents the dialog from being dismissed when tapping outside of it
          child: Dialog(
            backgroundColor: Colors.transparent,
            child: Center(
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: UColors.white.withOpacity(0.7),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 80,
                      width: 80,
                      child: CircularProgressIndicator(
                        color: UColors.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static void stopLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
