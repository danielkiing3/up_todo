import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:up_todo/src/common/widgets/appbar/app_bar.dart';
import 'package:up_todo/src/common/widgets/texts/section_heading.dart';
import 'package:up_todo/src/features/authenication/presentation/controllers/login/login_provider.dart';
import 'package:up_todo/src/utils/constants/image_strings.dart';
import 'package:up_todo/src/utils/constants/routes.dart';
import 'package:up_todo/src/utils/constants/sizes.dart';
import 'package:up_todo/src/utils/constants/texts.dart';

import '../../../../../common/widgets/buttons/elevated_button.dart';
import '../../../../../common/widgets/buttons/social_button.dart';
import '../../../../../common/widgets/divider/divider.dart';
import 'widgets/login_form.dart';
import '../../../../../common/widgets/richtext/login_register_rich_text.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const UAppBar(showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -- Heading
              const USectionHeading(title: UTexts.login),
              const SizedBox(height: USizes.appBarHeight),

              /// -- Login Form
              const ULoginForm(),
              const SizedBox(height: USizes.biggerSpaceBtwSections),

              /// -- Login Button
              UElevatedButton(
                text: UTexts.login,
                onPressed: () => ref
                    .read(loginProvider.notifier)
                    .emailAndPasswordSignIn(context),
              ),
              const SizedBox(height: USizes.spaceBtwSections * 1.2),

              /// -- Divider
              const UDivider(),
              const SizedBox(height: USizes.defaultSpace * 1.3),

              /// -- Social Button
              USocialButton(
                image: UImages.google,
                text: UTexts.loginWithGoogle,
                onPressed: () =>
                    ref.read(loginProvider.notifier).loginWithGoogle(context),
              ),
              const SizedBox(height: USizes.defaultSpace),

              USocialButton(
                image: UImages.apple,
                text: UTexts.loginWithApple,
                onPressed: () {},
              ),
              const SizedBox(height: USizes.defaultSpace * 2),

              /// -- Bottom Rich Text
              const ULoginRegisterRichText(
                text: UTexts.donthaveaccount,
                addText: UTexts.register,
                location: URoutes.createAccountScreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
