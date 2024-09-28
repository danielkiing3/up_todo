import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/src/features/todo/presentation/controllers/add_task_popup/choose_category_provider.dart';
import 'package:up_todo/src/utils/constants/texts.dart';

class EditChooseCategoryActionButton extends ConsumerWidget {
  const EditChooseCategoryActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              ref.read(chooseCategoryProvider.notifier).reset();
              context.pop();
            },
            child: const Text(UTexts.cancel),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              ref.read(chooseCategoryProvider.notifier).editCategory(context);
            },
            child: const Text(UTexts.edit),
          ),
        )
      ],
    );
  }
}
