import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:up_todo/src/utils/validators/validation.dart';

import '../../../controllers/login/login_provider.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/texts.dart';

/// -- Login and Register Form
class ULoginForm extends ConsumerWidget {
  const ULoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: ref.watch(loginProvider.notifier).loginFormkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// -- Username
          const Text(UTexts.emaail),
          const SizedBox(height: USizes.smallSpaceBtwItems),
          TextFormField(
            controller: ref.watch(loginProvider.notifier).email,
            validator: UValidator.validateEmail,
            decoration: const InputDecoration(hintText: UTexts.enterEmail),
          ),
          const SizedBox(height: USizes.defaultSpace),

          /// -- Password
          const Text(UTexts.password),
          const SizedBox(height: USizes.smallSpaceBtwItems),
          TextFormField(
            obscureText: ref.watch(hidePasswordLoginProvider),
            validator: UValidator.validatePassword,
            controller: ref.watch(loginProvider.notifier).password,
            decoration: InputDecoration(
              hintText: '• • • • • • • • • • ',
              // Hide and show password
              suffixIcon: IconButton(
                onPressed: () =>
                    ref.read(hidePasswordLoginProvider.notifier).state =
                        !ref.read(hidePasswordLoginProvider.notifier).state,
                icon: Icon(ref.watch(hidePasswordLoginProvider)
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
