import 'package:flutter/material.dart';
import 'package:up_todo/src/utils/constants/colors.dart';
import 'package:up_todo/src/utils/theme/custom_themes/appbar_theme.dart';
import 'package:up_todo/src/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:up_todo/src/utils/theme/custom_themes/card_theme.dart';
import 'package:up_todo/src/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:up_todo/src/utils/theme/custom_themes/icon_theme.dart';
import 'package:up_todo/src/utils/theme/custom_themes/input_field_theme.dart';
import 'package:up_todo/src/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:up_todo/src/utils/theme/custom_themes/text_button_theme.dart';
import 'package:up_todo/src/utils/theme/custom_themes/text_theme.dart';

/// -- App Theme(Only Dark Mode)
class UAppTheme {
  static ThemeData appTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: UColors.primary,
    fontFamily: 'Lato',
    textTheme: UTextTheme.textTheme,
    scaffoldBackgroundColor: UColors.black,
    appBarTheme: UAppBarTheme.appBarTheme,
    cardTheme: UCardTheme.cardTheme,
    iconTheme: UIconTheme.iconTheme,
    textButtonTheme: UTextButtonTheme.textButtonThemeData,
    bottomSheetTheme: UBottomSheetTheme.bottomSheetThemeData,
    elevatedButtonTheme: UElevatedButtonTheme.elevatedButtonTheme,
    outlinedButtonTheme: UOutlinedButtonTheme.outlinedButtonTheme,
    inputDecorationTheme: UInputFieldTheme.inputDecorationTheme,
  );
}
