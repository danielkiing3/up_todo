import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

/// Custom Dialog Widget
class UDialog extends StatelessWidget {
  /// -- Custom dialog widget
  ///
  /// Requires
  ///   - [heading] - Title of the dialog
  ///   - [content] - Main widget of the dialog
  ///   - [actionButton] - Action button of the dialog of the dialog
  const UDialog({
    super.key,
    required this.heading,
    required this.content,
    required this.actionButton,
  });

  final String heading;
  final Widget content;
  final Widget actionButton;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(USizes.md),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(USizes.sm),
          color: UColors.bottomSheetPrimary,
        ),
        padding: const EdgeInsets.all(USizes.md),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // -- Header
              Text(
                heading,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: USizes.sm),

              // -- Divider
              const Divider(color: UColors.borderPrimary, height: 10),
              const SizedBox(height: USizes.md),

              // Main Content
              content,
              const SizedBox(height: 16),

              // Action Buttons
              actionButton,
            ],
          ),
        ),
      ),
    );
  }
}
