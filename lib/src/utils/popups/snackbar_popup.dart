import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:up_todo/src/common/widgets/snackbar/snackbar.dart';

import '../constants/colors.dart';

class USnackBarPopup {
  /// DO NOT INTIALIZE THIS CLASS
  USnackBarPopup._();

  //TODO: Placeholder for a future custom toast implementation
  static customToast() {}

  // Method to show a success-themed SnackBar
  static sucessSnackBar(BuildContext context,
      {String message = ' ', required String title}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      UCustomSnackBar.show(context,
          title: title,
          message: message,
          backgroundColor: UColors.primary,
          icon: IconsaxPlusLinear.tick_square),
    );
  }

  // Method to show a warning-themed SnackBar
  static warningSnackBar(BuildContext context,
      {String message = ' ', required String title}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      UCustomSnackBar.show(context,
          title: title,
          message: message,
          backgroundColor: Colors.orange,
          icon: IconsaxPlusLinear.warning_2),
    );
  }

// Method to show an error-themed SnackBar
  static errorSnackBar(BuildContext context,
      {message = '', required String title}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      UCustomSnackBar.show(context,
          title: title,
          message: message,
          backgroundColor: Colors.red.shade600,
          icon: IconsaxPlusLinear.warning_2),
    );
  }
}
