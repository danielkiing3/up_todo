import 'package:flutter/material.dart';
import 'package:up_todo/utils/constants/colors.dart';

/// -- AppBarTheme
class UAppBarTheme {
  UAppBarTheme._();

  static AppBarTheme appBarTheme = const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: UColors.white),
    actionsIconTheme: IconThemeData(color: UColors.white),
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: UColors.white,
    ),
  );
}
