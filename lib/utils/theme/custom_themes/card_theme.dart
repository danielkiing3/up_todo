import 'package:flutter/material.dart';
import 'package:up_todo/utils/constants/colors.dart';
import 'package:up_todo/utils/constants/sizes.dart';

class UCardTheme {
  UCardTheme._();

  static CardTheme cardTheme = CardTheme(
    elevation: 0,
    color: UColors.bottomSheetPrimary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(USizes.borderRadius),
    ),
  );
}
