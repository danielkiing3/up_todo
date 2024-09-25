import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:up_todo/src/features/todo/presentation/controllers/create_category/create_category_provider.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/texts.dart';

class CreateCategoryActionButton extends ConsumerWidget {
  const CreateCategoryActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: USizes.buttonHeight),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () =>
                  ref.read(createNewCategoryProvider.notifier).cancel(context),
              child: const Text(UTexts.cancel),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () => ref
                  .read(createNewCategoryProvider.notifier)
                  .createNewCategory(context),
              child: const Text(UTexts.createCategory),
            ),
          )
        ],
      ),
    );
  }
}
