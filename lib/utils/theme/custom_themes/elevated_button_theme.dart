import 'package:flutter/material.dart';
import 'package:up_todo/utils/constants/colors.dart';
import 'package:up_todo/utils/constants/sizes.dart';

/// -- Elevated Button Theme
class UElevatedButtonTheme {
  UElevatedButtonTheme._();

  static ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: UColors.primary,
      fixedSize: const Size.fromHeight(48),
      foregroundColor: UColors.white,
      disabledBackgroundColor: UColors.buttonDisabled,
      disabledForegroundColor: UColors.white.withOpacity(0.5),
      side: const BorderSide(color: UColors.buttonPrimary),
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
