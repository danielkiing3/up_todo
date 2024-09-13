import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:up_todo/src/common/widgets/appbar/app_bar.dart';
import 'package:up_todo/src/features/personalization/screens/profile/widgets/setting_heading.dart';
import 'package:up_todo/src/utils/constants/sizes.dart';
import 'package:up_todo/src/utils/constants/texts.dart';

import 'widgets/setting_menu_tile.dart';

class AppSettingsScreen extends StatelessWidget {
  const AppSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UAppBar(
        showBackArrow: true,
        title: Text(UTexts.settings),
      ),
      body: Padding(
        padding: const EdgeInsets.all(USizes.smallDefaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// -- Settings
            const USettingHeading(title: UTexts.settings),
            USettingMenuTile(
              leadingIcon: IconsaxPlusLinear.brush_2,
              title: UTexts.changeAppColor,
              onTap: () {},
            ),
            USettingMenuTile(
              leadingIcon: IconsaxPlusLinear.text,
              title: UTexts.changeAppTypography,
              onTap: () {},
            ),
            USettingMenuTile(
              leadingIcon: IconsaxPlusLinear.language_square,
              title: UTexts.changeAppLanguage,
              onTap: () {},
            ),
            const SizedBox(height: USizes.spaceBtwItems),

            /// -- Import
            const USettingHeading(title: UTexts.import),
            USettingMenuTile(
              leadingIcon: IconsaxPlusLinear.import_2,
              title: UTexts.importFromGoogleCalender,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
