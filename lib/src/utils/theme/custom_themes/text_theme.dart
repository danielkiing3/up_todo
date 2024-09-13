import 'package:flutter/material.dart';
import 'package:up_todo/src/utils/constants/colors.dart';
import 'package:up_todo/src/utils/constants/sizes.dart';

class UTextTheme {
  UTextTheme._();

  static TextTheme textTheme = TextTheme(
    // Headline
    headlineLarge: const TextStyle().copyWith(
        fontSize: USizes.fontSizeXl,
        fontWeight: FontWeight.bold,
        color: UColors.textPrimary),
    headlineMedium: const TextStyle().copyWith(
        fontSize: USizes.fontSizeLg,
        fontWeight: FontWeight.w600,
        color: UColors.textPrimary),
    headlineSmall: const TextStyle().copyWith(
        fontSize: USizes.fontSizeMd,
        fontWeight: FontWeight.w600,
        color: UColors.textPrimary),

    // Title
    titleLarge: const TextStyle().copyWith(
        fontSize: USizes.fontSizeLg,
        fontWeight: FontWeight.w600,
        color: UColors.textPrimary),
    titleMedium: const TextStyle().copyWith(
        fontSize: USizes.fontSizeLg,
        fontWeight: FontWeight.w500,
        color: UColors.textPrimary),
    titleSmall: const TextStyle().copyWith(
        fontSize: USizes.fontSizeLg,
        fontWeight: FontWeight.w400,
        color: UColors.textPrimary),

    // Body
    bodyLarge: const TextStyle().copyWith(
        fontSize: USizes.fontSizeSm,
        fontWeight: FontWeight.w500,
        color: UColors.textPrimary),
    bodyMedium: const TextStyle().copyWith(
        fontSize: USizes.fontSizeSm,
        fontWeight: FontWeight.normal,
        color: UColors.textPrimary),
    bodySmall: const TextStyle().copyWith(
        fontSize: USizes.fontSizeSm,
        fontWeight: FontWeight.w500,
        color: UColors.textPrimary.withOpacity(0.5)),

    // Label
    labelLarge: const TextStyle().copyWith(
        fontSize: USizes.fontSizeXs,
        fontWeight: FontWeight.w600,
        color: UColors.textPrimary),
    labelMedium: const TextStyle().copyWith(
        fontSize: USizes.fontSizeXs,
        fontWeight: FontWeight.w400,
        color: UColors.textPrimary.withOpacity(0.5)),
  );
}
