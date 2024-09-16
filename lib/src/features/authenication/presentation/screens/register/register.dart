import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:up_todo/src/common/widgets/appbar/app_bar.dart';
import 'package:up_todo/src/features/authenication/presentation/controllers/register/register_provider.dart';
import 'package:up_todo/src/features/authenication/presentation/screens/register/widgets/register_form.dart';
import 'package:up_todo/src/utils/constants/routes.dart';

import '../../../../../common/widgets/buttons/elevated_button.dart';
import '../../../../../common/widgets/buttons/social_button.dart';
import '../../../../../common/widgets/divider/divider.dart';
import '../../../../../common/widgets/richtext/login_register_rich_text.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

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
              const USectionHeading(title: UTexts.register),
              const SizedBox(height: USizes.defaultSpace),

              /// -- Register Form
              const URegisterForm(),
              const SizedBox(height: USizes.bigSpaceBtwSections),

              /// -- Register Button
              UElevatedButton(
                  text: UTexts.register,
                  onPressed: () => ref
                      .read(registerProvider.notifier)
                      .emailAndPasswordRegister(context)),
              const SizedBox(height: USizes.defaultSpace),

              /// -- Divider
              const UDivider(),
              const SizedBox(height: USizes.defaultSpace),

              /// -- Social Button
              USocialButton(
                image: UImages.google,
                text: UTexts.registerWithGoogle,
                onPressed: () => ref
                    .read(registerProvider.notifier)
                    .registerWithGoogle(context),
              ),
              const SizedBox(height: USizes.defaultSpace),

              USocialButton(
                image: UImages.apple,
                text: UTexts.registerWithApple,
                onPressed: () {},
              ),
              const SizedBox(height: USizes.defaultSpace * 2),

              /// -- Bottom Rich Text
              const ULoginRegisterRichText(
                text: UTexts.alreadyhaveaccount,
                addText: UTexts.login,
                location: URoutes.loginScreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
