import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:up_todo/src/common/widgets/appbar/app_bar.dart';
import 'package:up_todo/src/features/todo/services/todo_service_repository.dart';
import 'package:up_todo/src/utils/constants/image_strings.dart';
import 'package:up_todo/src/utils/constants/sizes.dart';
import 'package:up_todo/src/utils/constants/texts.dart';
import 'package:up_todo/src/utils/device/device_utility.dart';

class IndexScreen extends ConsumerWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoValue = ref.watch(todoServiceProvider);

    return Scaffold(
      appBar: UAppBar(
        leadingIcon: IconsaxPlusLinear.sort,
        title: const Text(UTexts.index),
        actions: [
          Image(
            image: AssetImage(UImages.user),
          )
        ],
      ),
      body: todoValue.when(
        data: (value) {
          if (value.isEmpty) {
            return IndexEmptyPage();
          } else {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        error: (error, stackTrace) {},
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class IndexEmptyPage extends StatelessWidget {
  const IndexEmptyPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              width: UDeviceUtils.getScreenWidth(context) * 0.6,
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
    );
  }
}
