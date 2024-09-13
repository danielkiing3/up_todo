import 'package:flutter/material.dart';
import 'package:up_todo/src/utils/constants/colors.dart';

class UInputFieldTheme {
  UInputFieldTheme._();

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    filled: true,
    constraints: const BoxConstraints(minHeight: 56),
    fillColor: UColors.darkerGrey,
    labelStyle: const TextStyle().copyWith(
        fontSize: 16, color: UColors.textWhite, fontWeight: FontWeight.w400),
    hintStyle: const TextStyle().copyWith(
        fontSize: 16, color: UColors.grey, fontWeight: FontWeight.w400),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(width: 1, color: UColors.borderPrimary),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(width: 1, color: UColors.borderPrimary),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(width: 1, color: UColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(width: 1, color: UColors.error),
    ),
  );
}
