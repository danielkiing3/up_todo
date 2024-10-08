import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:up_todo/src/common/widgets/dialog/dialog.dart';
import 'package:up_todo/src/features/todo/presentation/screens/edit_task/edit_task.dart';
import 'package:up_todo/src/utils/constants/texts.dart';

import 'add_task_widgets/add_task_main_body.dart';
import 'choose_category_widget.dart/choose_category_action_button.dart';
import 'choose_category_widget.dart/choose_category_grid_view.dart';
import 'choose_date_widgets/choose_date_container.dart';
import 'choose_time_widgets/choose_time_action_buttons.dart';
import 'choose_time_widgets/choose_time_container.dart';
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

  static void showDateDialog(BuildContext context, WidgetRef ref) {
    showDialog(
        context: context,
        builder: (context) {
          return const ChooseDateContainer();
        });
  }

  static void showTimeDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const UDialog(
            heading: UTexts.chooseTime,
            content: ChooseTimeContainer(),
            actionButton: ChooseTimeActionButtons(),
          );
        });
  }

  static void showPriorityDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const UDialog(
          heading: UTexts.taskPriority,
          content: TaskPriorityGridView(),
          actionButton: TaskPriorityActionButton(),
        );
      },
    );
  }

  static void iosBottomSheet(BuildContext context) {
    CupertinoScaffold.showCupertinoModalBottomSheet(
      context: context,
      useRootNavigator: true,
      expand: true,
      builder: (context) => const EditTaskScreen(),
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
      },
    );
  }
}
