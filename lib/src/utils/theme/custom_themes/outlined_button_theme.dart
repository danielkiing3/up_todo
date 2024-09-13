import 'package:flutter/material.dart';
import 'package:up_todo/src/utils/constants/colors.dart';
import 'package:up_todo/src/utils/constants/sizes.dart';

/// -- Elevated Button Theme
class UOutlinedButtonTheme {
  UOutlinedButtonTheme._();

  static OutlinedButtonThemeData outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: UColors.white,
      side: const BorderSide(color: UColors.buttonPrimary, width: 2),
      fixedSize: const Size.fromHeight(48),
      padding: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(USizes.buttonRadius),
      ),
      textStyle: const TextStyle(
        fontSize: USizes.fontSizeSm,
        color: UColors.white,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
