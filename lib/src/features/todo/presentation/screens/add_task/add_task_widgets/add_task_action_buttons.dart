import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:up_todo/src/features/todo/presentation/controllers/add_todo/add_todo_provider.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../controllers/add_todo/task_tag_provider.dart';
import '../add_todo_popup.dart';

class AddTaskActionButtons extends ConsumerWidget {
  /// Custom Widget for the bottom action button for the Add Task Dialog
  const AddTaskActionButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskTag = ref.watch(taskTagProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // -- Date Picker Button
            IconButton(
                onPressed: () => TodoBottomSheet.showDateDialog(context, ref),
                icon: Icon(
                  IconsaxPlusLinear.timer_1,
                  // Conditionally change the color if [date] is selected
                  color: taskTag.date != null ? UColors.primary : null,
                )),

            // -- Category Button
            IconButton(
                onPressed: () => TodoBottomSheet.showCategoryDialog(context),
                icon: Icon(
                  IconsaxPlusLinear.tag,
                  // Conditionally change the color if [category] is selected
                  color: taskTag.category != null ? UColors.primary : null,
                )),

            // -- Priority Button
            IconButton(
                onPressed: () => TodoBottomSheet.showPriorityDialog(context),
                icon: Icon(
                  IconsaxPlusLinear.flag,
                  // Conditionally change the color if [priority] is selected
                  color: taskTag.priority != null ? UColors.primary : null,
                )),
          ],
        ),

        // -- Save Task Button
        IconButton(
          onPressed: () =>
              ref.read(addTaskProvider.notifier).createNewTodo(context),
          icon: Icon(
            IconsaxPlusLinear.send_1,
            color: UColors.primary,
          ),
        ),
      ],
    );
  }
}
