import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:up_todo/src/common/widgets/appbar/app_bar.dart';
import 'package:up_todo/src/features/todo/services/todo_service_repository.dart';
import 'package:up_todo/src/utils/constants/image_strings.dart';
import 'package:up_todo/src/utils/constants/texts.dart';

import 'widgets/empty_home_placeholder.dart';
import 'widgets/home_content.dart';

/// Custom home screen that listens to a provider and shows information
///  conditionally backed on Async state
class IndexScreen extends ConsumerWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskValue = ref.watch(todoServiceProvider);

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
      body: taskValue.when(
        data: (value) {
          if (value.isEmpty) {
            return const EmptyHomePlaceholder();
          } else {
            return HomeContent(taskList: value);
          }
        },
        error: (error, stackTrace) {
          return;
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
