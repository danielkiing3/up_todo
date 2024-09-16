import 'package:flutter/material.dart';
//DONE

/// -- Data class to model the [Category] with name, icon, iconColor and
///  backgroundColor generate by changing the iconColor
/// Required:
///   - [name] - Category name
///   - [icon] - Category icon
///   - [iconColor] - Category icon
///
///
/// Generate:
///   - [backgroundColor] - Generate by converting the [iconColor] to HSL and
/// modifying it's Lightness value to [75]
class Category {
  String name;
  bool isCreateNewButton;
  IconData icon;
  Color iconColor;
  Color backgroundColor;

  Category({
    required this.name,
    required this.icon,
    required this.iconColor,
    this.isCreateNewButton = false,
  }) : backgroundColor =
            HSLColor.fromColor(iconColor).withLightness(0.75).toColor();
}
