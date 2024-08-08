import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:up_todo/common/widgets/appbar/app_bar.dart';
import 'package:up_todo/common/widgets/texts/section_heading.dart';
import 'package:up_todo/features/todo/screens/navigation/navigation_menu.dart';
import 'package:up_todo/utils/constants/image_strings.dart';
import 'package:up_todo/utils/constants/sizes.dart';
import 'package:up_todo/utils/constants/texts.dart';

import '../../../../common/widgets/buttons/elevated_button.dart';
import '../../../../common/widgets/buttons/social_button.dart';
import '../../../../common/widgets/divider/divider.dart';
import '../../../../common/widgets/form/login_register_form.dart';
import '../../../../common/widgets/richtext/login_register_rich_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              const ULoginRegisterForm(),
              const SizedBox(height: USizes.biggerSpaceBtwSections),

              /// -- Login Button
              UElevatedButton(
                  text: UTexts.login,
                  onPressed: () => Get.offAll(
                        () => const NavigationMenu(),
                      )),
              const SizedBox(height: USizes.spaceBtwSections * 1.2),

              /// -- Divider
              const UDivider(),
              const SizedBox(height: USizes.defaultSpace * 1.3),

              /// -- Social Button
              USocialButton(
                image: UImages.google,
                text: UTexts.loginWithGoogle,
                onPressed: () {},
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
                  text: UTexts.donthaveaccount, addText: UTexts.register),
            ],
          ),
        ),
      ),
    );
  }
}
