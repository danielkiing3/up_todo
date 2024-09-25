import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/src/features/todo/models/todo/task_model.dart';
import 'package:up_todo/src/features/todo/services/todo_service_repository.dart';

import 'task_tag_provider.dart';

class AddTaskNotifier extends Notifier {
  final title = TextEditingController();
  final description = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  build() {}

  void createNewTodo(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final taskTag = ref.read(taskTagProvider);

    final todo = Task(
      title: title.text.trim(),
      description: description.text.trim(),
      categoryId: taskTag.category?.id,
      date: taskTag.date,
      priority: taskTag.priority,
      time: taskTag.date.toString(),
    );

    // Talking to the Todo Service
    await ref.read(todoServiceProvider.notifier).addNewTask(todo);

    // -- Clearing controller
    title.clear(); // Title controller
    description.clear(); // Description controller
    ref.read(taskTagProvider.notifier).clearValues(); //

    if (context.mounted) {
      context.pop();
    }
  }
}

final addTaskProvider =
    NotifierProvider<AddTaskNotifier, void>(AddTaskNotifier.new);
