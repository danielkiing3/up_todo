import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:up_todo/src/features/todo/presentation/screens/edit_task/popup/edit_task_popup.dart';

import '../../../../../../common/widgets/action_chip/action_chip.dart';
import '../../../../repositories/category_repository.dart';
import '../../../controllers/edit_task/edit_task_provider.dart';
import 'edit_task_row.dart';

class EditTaskCategory extends ConsumerWidget {
  const EditTaskCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryId = ref.watch(categoryEditProvider);

    final category = categoryId != null
        ? ref.read(categoriesRepository.notifier).getCategory(categoryId)
        : null;

    return EditTaskRow(
      icon: IconsaxPlusLinear.tag,
      name: 'Task Category',
      actionChip: UActionChip(
        onTap: () => EditTaskPopup.showCategoryDialog(context),
        content: category != null
            ? Row(
                children: [
                  Icon(
                    category.icon,
                    color: category.iconColor,
                  ),
                  const SizedBox(width: 8),
                  Text(category.name)
                ],
              )
            : const Text('Empty Category'),
      ),
    );
  }
}
