import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:up_todo/src/common/widgets/dialog/dialog.dart';
import 'package:up_todo/src/features/todo/presentation/screens/add_task_popup/choose_category_widget.dart/choose_category_grid_view.dart';
import 'package:up_todo/src/utils/constants/texts.dart';

import 'edit_choose_category_action_button.dart';

class EditTaskPopup {
  static void showCategoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const UDialog(
        heading: UTexts.chooseCategory,
        content: ChooseCategoryGridView(),
        actionButton: EditChooseCategoryActionButton(),
      ),
    );
  }
}
