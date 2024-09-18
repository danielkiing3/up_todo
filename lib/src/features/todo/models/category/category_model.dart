import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

/// -- Data class to model the [Category] with name, icon, iconColor and
///  backgroundColor generate by changing the iconColor
/// Required:
///   - [id] - Generate Category id
///   - [name] - Category name
///   - [icon] - Category icon
///   - [iconColor] - Category icon
///
///
/// Generate:
///   - [backgroundColor] - Generate by converting the [iconColor] to HSL and
/// modifying it's Lightness value to [75]
///

const uuid = Uuid();

class Category {
  final String id;
  String name;
  bool isCreateNewButton;
  IconData icon;
  Color iconColor;
  Color backgroundColor;

  Category({
    id,
    required this.name,
    this.isCreateNewButton = false,
    required this.icon,
    required this.iconColor,
  })  : id = id ?? uuid.v1(),
        backgroundColor =
            HSLColor.fromColor(iconColor).withLightness(0.75).toColor();
}
