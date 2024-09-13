import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/texts.dart';
import '../../../../../../utils/validators/validation.dart';
import '../../../controllers/register/register_provider.dart';

/// -- Register Form
class URegisterForm extends ConsumerWidget {
  const URegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: ref.watch(registerProvider.notifier).registerFormkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// -- Email
          const Text(UTexts.emaail),
          const SizedBox(height: USizes.smallSpaceBtwItems),
          TextFormField(
            controller: ref.watch(registerProvider.notifier).email,
            validator: UValidator.validateEmail,
            decoration: const InputDecoration(hintText: UTexts.enterEmail),
          ),
          const SizedBox(height: USizes.defaultSpace),

          /// -- Password
          const Text(UTexts.password),
          const SizedBox(height: USizes.smallSpaceBtwItems),
          TextFormField(
            obscureText: ref.watch(hidePasswordRegsiterProvider),
            controller: ref.watch(registerProvider.notifier).password,
            validator: UValidator.validatePassword,
            decoration: InputDecoration(
              hintText: '• • • • • • • • • • ',
              // Hide and show password
              suffixIcon: IconButton(
                onPressed: () =>
                    ref.read(hidePasswordRegsiterProvider.notifier).state =
                        !ref.read(hidePasswordRegsiterProvider.notifier).state,
                icon: Icon(ref.watch(hidePasswordRegsiterProvider)
                    ? IconsaxPlusLinear.eye_slash
                    : IconsaxPlusLinear.eye),
              ),
            ),
          ),

          /// -- Create Password
          const SizedBox(height: USizes.defaultSpace),
          const Text(UTexts.confirmPassword),
          const SizedBox(height: USizes.smallSpaceBtwItems),
          TextFormField(
            obscureText: ref.watch(hideConfirmPasswordRegsiterProvider),
            controller: ref.watch(registerProvider.notifier).confirmPassword,
            validator: (value) {
              final password =
                  ref.read(registerProvider.notifier).password.text;
              return UValidator.confirmPassword(value, password);
            },
            decoration: InputDecoration(
              hintText: '• • • • • • • • • • ',
              // Hide and show password
              suffixIcon: IconButton(
                onPressed: () => ref
                        .read(hideConfirmPasswordRegsiterProvider.notifier)
                        .state =
                    !ref
                        .read(hideConfirmPasswordRegsiterProvider.notifier)
                        .state,
                icon: Icon(ref.watch(hideConfirmPasswordRegsiterProvider)
                    ? IconsaxPlusLinear.eye_slash
                    : IconsaxPlusLinear.eye),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
