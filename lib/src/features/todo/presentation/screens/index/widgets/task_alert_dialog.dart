import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/src/features/todo/services/todo_service_repository.dart';
import 'package:up_todo/src/utils/constants/colors.dart';
import 'package:up_todo/src/utils/constants/texts.dart';

class TaskAlertDialog extends ConsumerWidget {
  const TaskAlertDialog({
    super.key,
    required this.taskId,
    required this.title,
  });

  final String taskId;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog.adaptive(
      title: const Text('Delete Task'),
      content: Text('Are you sure you want to delete "$title" ?'),
      actions: [
        TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text(
              UTexts.cancel,
              style: TextStyle(color: Colors.white),
            )),
        TextButton(
            onPressed: () {
              context.pop();
              ref.read(todoServiceProvider.notifier).deleteTask(taskId);
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: UColors.error),
            )),
      ],
    );
  }
}
