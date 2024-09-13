import 'package:flutter/material.dart';
import 'package:up_todo/src/utils/constants/colors.dart';

class UCustomSnackBar {
  /// DO NOT INITIALIZE THE CLASS
  UCustomSnackBar._();

  // Static method to create and return a customized SnackBar
  static SnackBar show(
    BuildContext context, {
    required String title, // Title text of the SnackBar
    required String message, // Main message text of the SnackBar
    required Color backgroundColor, // Background color of the SnackBar
    required IconData icon, // Icon displayed at the start of the SnackBar
  }) {
    return SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(20),
      content: Row(
        children: [
          Flexible(child: Icon(icon, color: UColors.white)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 10),
                Text(
                  message,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
