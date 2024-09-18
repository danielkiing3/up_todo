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
    this.isCreateNewButton = false,
    required this.icon,
    required this.iconColor,
  }) : backgroundColor =
            HSLColor.fromColor(iconColor).withLightness(0.75).toColor();

  // Convert Category to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isCreateNewButton': isCreateNewButton,
      'icon': icon.codePoint, // Store icon as its code point
      'iconColor': iconColor.value, // Store color as an integer value
      'backgroundColor':
          backgroundColor.value, // Store background color as an integer
    };
  }

  /// Create a Category from JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      isCreateNewButton: json['isCreateNewButton'] ?? false,
      icon: IconData(json['icon'],
          fontFamily: 'MaterialIcons'), // Restore IconData using code point
      iconColor: Color(json['iconColor']), // Restore Color using integer value
    );
  }
}
