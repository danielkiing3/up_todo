import 'package:flutter/material.dart';
import 'package:up_todo/utils/constants/colors.dart';
import 'package:up_todo/utils/constants/sizes.dart';

class UBottomSheetTheme {
  UBottomSheetTheme._();

  static BottomSheetThemeData bottomSheetThemeData = BottomSheetThemeData(
    showDragHandle: false,
    backgroundColor: UColors.bottomSheetPrimary,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(USizes.borderRadiusLg)),
  );
}
