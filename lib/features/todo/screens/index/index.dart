import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:up_todo/common/widgets/appbar/app_bar.dart';
import 'package:up_todo/utils/constants/image_strings.dart';
import 'package:up_todo/utils/constants/sizes.dart';
import 'package:up_todo/utils/constants/texts.dart';
import 'package:up_todo/utils/device/device_utility.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        leadingIcon: IconsaxPlusLinear.sort,
        title: Text(UTexts.index),
      ),
      body: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: Center(
          child: Column(
            children: [
              /// -- Image
              const SizedBox(height: USizes.xl),
              Image(
                image: AssetImage(
                  UImages.emptyHomeImage,
                ),
                width: UDeviceUtils.getScreenWidth() * 0.6,
              ),
              const SizedBox(height: USizes.md),

              /// -- Text
              Text(
                UTexts.homeEmptyTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: USizes.md),
              Text(
                UTexts.homeEmptySubtitle,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
