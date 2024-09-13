import 'package:flutter/material.dart';
import 'package:up_todo/src/utils/constants/colors.dart';
import 'package:up_todo/src/utils/constants/sizes.dart';

class UTextButtonTheme {
  UTextButtonTheme._();

  static TextButtonThemeData textButtonThemeData = TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      foregroundColor: UColors.white.withOpacity(0.44),
      textStyle: const TextStyle(
        fontSize: USizes.fontSizeSm,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
