import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:up_todo/src/common/styles/spacing_style_appbar.dart';
import 'package:up_todo/src/features/personalization/screens/profile/widgets/modals/change_account_name_modal.dart';
import 'package:up_todo/src/utils/constants/image_strings.dart';
import 'package:up_todo/src/utils/constants/routes.dart';
import 'package:up_todo/src/utils/constants/sizes.dart';
import 'package:up_todo/src/utils/constants/texts.dart';

import '../../../../common/widgets/container/text_container.dart';
import 'widgets/profile_header.dart';
import 'widgets/setting_heading.dart';
import 'widgets/setting_menu_tile.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: USpacingStyles.paddingWithAppbarHeight,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -- Heading
              UProfileHeader(image: UImages.profilePicture),
              const SizedBox(height: USizes.defaultSpace),

              /// Task Button
              const Row(
                children: [
                  // -- Task Left
                  Expanded(child: UTextContainer(text: '10 Task Left')),
                  SizedBox(width: 20),

                  // -- Task Done
                  Expanded(child: UTextContainer(text: '5 Task Done')),
                ],
              ),
              const SizedBox(height: USizes.bigSpaceBtwSections),

              /// -- Settings body
              const USettingHeading(title: UTexts.settings),
              USettingMenuTile(
                leadingIcon: IconsaxPlusLinear.setting_2,
                title: UTexts.appSettings,
                onTap: () => context.pushNamed(URoutes.settingsScreen),
              ),
              const SizedBox(height: USizes.spaceBtwItems),

              /// -- Account Section
              const USettingHeading(title: UTexts.account),
              USettingMenuTile(
                leadingIcon: IconsaxPlusLinear.user,
                title: UTexts.changeAccountName,
                onTap: () {},
              ),
              USettingMenuTile(
                leadingIcon: IconsaxPlusLinear.key,
                title: UTexts.changeAccountPasswordd,
                onTap: () {},
              ),
              USettingMenuTile(
                leadingIcon: IconsaxPlusLinear.camera,
                title: UTexts.changeAccountImage,
                onTap: () => ProfileModal.changeAccountImage(context),
              ),
              const SizedBox(height: USizes.spaceBtwItems),

              /// -- UpTodo
              const USettingHeading(title: UTexts.upTodo),
              USettingMenuTile(
                leadingIcon: IconsaxPlusLinear.user,
                title: UTexts.aboutUs,
                onTap: () {},
              ),
              USettingMenuTile(
                leadingIcon: IconsaxPlusLinear.key,
                title: UTexts.faq,
                onTap: () {},
              ),
              USettingMenuTile(
                leadingIcon: IconsaxPlusLinear.camera,
                title: UTexts.helpAndFeedback,
                onTap: () {},
              ),
              USettingMenuTile(
                leadingIcon: IconsaxPlusLinear.camera,
                title: UTexts.supportUs,
                onTap: () {},
              ),
              USettingMenuTile(
                leadingIcon: IconsaxPlusLinear.camera,
                title: UTexts.logOut,
                isLogout: true,
                onTap: () {},
              ),
              const SizedBox(height: USizes.bigSpaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
