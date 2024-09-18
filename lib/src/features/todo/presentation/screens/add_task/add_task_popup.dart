import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:up_todo/src/common/widgets/dialog/dialog.dart';
import 'package:up_todo/src/features/todo/presentation/controllers/add_todo/add_todo_provider.dart';
import 'package:up_todo/src/utils/constants/texts.dart';
import 'package:up_todo/src/utils/validators/validation.dart';

import '../../controllers/add_todo/date_provider.dart';
import 'add_task_widgets/add_task_action_buttons.dart';
import 'add_task_widgets/add_task_tag_row.dart';
import 'choose_category_widget.dart/choose_category_action_button.dart';
import 'choose_category_widget.dart/choose_category_grid_view.dart';
import 'task_priority_widget/task_priority_action_button.dart';
import 'task_priority_widget/task_priority_tag_grid_view.dart';

class TaskBottomSheet {
  static void addTodoDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      builder: (context) {
        return const AddTaskMainBody();
      },
    );
  }

  static Future<void> showDateDialog(
      BuildContext context, WidgetRef ref) async {
    //TODO: Build a custom time module
    final date = await showDatePicker(
        context: context,
        firstDate: DateTime(2024, 5),
        initialDate: DateTime.now(),
        currentDate: DateTime.now(),
        lastDate: DateTime.now());

    if (date != null) {
      ref.read(dateProvider.notifier).update(date);
    }
  }

  static void showPriorityDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const UDialog(
            heading: UTexts.taskPriority,
            content: TaskPriorityGridView(),
            actionButton: TaskPriorityActionButton());
      },
    );
  }

  static void showCategoryDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const UDialog(
            heading: UTexts.chooseCategory,
            content: ChooseCategoryGridView(),
            actionButton: ChooseCategoryActionButton(),
          );
        });
  }
}

class AddTaskMainBody extends ConsumerWidget {
  const AddTaskMainBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(
        top: 30,
        left: 25,
        right: 25,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            UTexts.addTask,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),

          // -- Title
          Form(
            key: ref.read(addTaskProvider.notifier).formKey,
            child: TextFormField(
              autofocus: true,
              maxLines: 1,
              maxLength: 50,
              controller: ref.read(addTaskProvider.notifier).title,
              validator: (value) =>
                  UValidator.validateEmptyText('Title', value),
              decoration: const InputDecoration(
                hintText: UTexts.exampleTitle,
                fillColor: Colors.transparent,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 10),

          // -- Description
          TextField(
            minLines: 1,
            maxLines: 2,
            controller: ref.read(addTaskProvider.notifier).description,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              hintText: UTexts.description,
              fillColor: Colors.transparent,
              enabledBorder: InputBorder.none,
            ),
          ),
          const SizedBox(height: 10),

          // -- Tag Row
          const AddTaskTagRow(),

          // -- Action Button
          const AddTaskActionButtons()
        ],
      ),
    );
  }
}
