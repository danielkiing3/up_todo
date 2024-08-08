import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';

/// -- Login and Register Form
class ULoginRegisterForm extends StatelessWidget {
  const ULoginRegisterForm({
    super.key,
    this.isRegisterForm = false,
  });

  final bool
      isRegisterForm; // Checks if the form is been used in Login or Register Screen

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// -- Username
          const Text(UTexts.username),
          const SizedBox(height: USizes.smallSpaceBtwItems),
          TextFormField(
            decoration: const InputDecoration(hintText: UTexts.enterUsername),
          ),
          const SizedBox(height: USizes.defaultSpace),

          /// -- Password
          const Text(UTexts.password),
          const SizedBox(height: USizes.smallSpaceBtwItems),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              hintText: '• • • • • • • • • • ',
            ),
          ),

          /// -- Create Password
          if (isRegisterForm) ...[
            const SizedBox(height: USizes.defaultSpace),
            const Text(UTexts.confirmPassword),
            const SizedBox(height: USizes.smallSpaceBtwItems),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: '• • • • • • • • • • ',
              ),
            ),
          ]
        ],
      ),
    );
  }
}
