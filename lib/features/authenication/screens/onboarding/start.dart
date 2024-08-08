import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:up_todo/common/widgets/appbar/app_bar.dart';
import 'package:up_todo/common/widgets/texts/section_heading.dart';
import 'package:up_todo/features/authenication/screens/login/login.dart';
import 'package:up_todo/features/authenication/screens/register/register.dart';
import 'package:up_todo/utils/constants/colors.dart';
import 'package:up_todo/utils/constants/sizes.dart';
import 'package:up_todo/utils/constants/texts.dart';

/// --  Welcome Screen
class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UAppBar(showBackArrow: true),
      body: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: Column(
          children: [
            /// -- Welcome Title and Subtitle
            const USectionHeading(title: UTexts.welcomeTitle),
            const SizedBox(height: USizes.spaceBtwSections),
            Text(
              UTexts.welcomeSubtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const Spacer(),

            /// -- Login Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const LoginScreen()),
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    backgroundColor:
                        WidgetStateProperty.all(UColors.buttonSecondary)),
                child: const Text(UTexts.loginWelcome),
              ),
            ),
            const SizedBox(height: USizes.spaceBtwSections),

            /// -- Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                //TODO: Naviagte to Create Account Page
                onPressed: () => Get.to(() => const RegisterScreen()),
                style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
                      side: WidgetStateProperty.all(
                        const BorderSide(
                            color: UColors.buttonSecondary, width: 2),
                      ),
                    ),
                child: const Text(UTexts.createAccount),
              ),
            ),
            const SizedBox(
              height: USizes.appBarHeight + 20,
            )
          ],
        ),
      ),
    );
  }
}
