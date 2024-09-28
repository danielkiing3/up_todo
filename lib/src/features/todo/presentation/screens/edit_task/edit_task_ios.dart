import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:up_todo/src/features/todo/presentation/screens/edit_task/edit_task.dart';

class EditTaskIos {
  static void showCupertinoModal(BuildContext context) {
    showCupertinoModalBottomSheet(
      context: context,
      builder: (context) {
        return const EditTaskContent();
      },
    );
  }
}
