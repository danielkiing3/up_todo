import 'package:flutter/material.dart';

/// -- Available color across the app
class UColors {
  UColors._();

  /// -- App Theme Color
  static Color primary = const Color.fromARGB(255, 138, 117, 255);
  static Color secondary = const Color.fromARGB(255, 136, 117, 255);
  static Color whiteAccent =
      const Color.fromARGB(255, 255, 255, 255).withOpacity(0.87);

  /// -- Text Colors
  static Color textPrimary =
      const Color.fromARGB(255, 255, 255, 255).withOpacity(0.87);
  static Color textSecondary = const Color.fromARGB(255, 175, 175, 175);
  static Color textAccent =
      const Color.fromARGB(255, 255, 255, 255).withOpacity(0.44);
  static Color textWhite = const Color.fromARGB(255, 255, 255, 255);

  /// -- Background Color
  static const Color primaryBackground = Color.fromARGB(255, 0, 0, 0);
  static const Color secondaryBackground = Color.fromARGB(255, 136, 117, 255);

  /// -- Bottom Sheet Color
  static const Color bottomSheetPrimary = Color.fromARGB(255, 54, 54, 54);

  /// -- Background Container Colors
  static Color primaryContainer =
      const Color.fromARGB(255, 255, 255, 255).withOpacity(0.21);

  /// -- Border colors
  static const Color borderPrimary = Color.fromARGB(255, 151, 151, 151);
  static const Color borderSecondary = Color.fromARGB(255, 230, 230, 230);

  // Button colors
  static const Color buttonPrimary = Color.fromARGB(255, 134, 135, 231);
  static const Color buttonSecondary = Color.fromARGB(255, 136, 117, 255);
  static Color buttonDisabled =
      const Color.fromARGB(255, 134, 135, 231).withOpacity(0.5);

  /// -- Error and Validation
  static const Color error = Color.fromARGB(255, 255, 73, 73);

  /// -- Neutral Shades
  static const Color black = Color.fromARGB(255, 0, 0, 0);
  static const Color grey = Color.fromARGB(255, 83, 83, 83);
  static const Color darkGrey = Color.fromARGB(255, 79, 79, 79);
  static const Color darkerGrey = Color.fromARGB(255, 29, 29, 29);
  static const Color darkestGrey = Color.fromARGB(255, 39, 39, 39);
  static const Color white = Color.fromARGB(255, 255, 255, 255);

  /// -- Category Color
  static const Color orange = Color.fromARGB(255, 201, 204, 65);
  static const Color lightGreen = Color.fromARGB(255, 102, 204, 65);
}
