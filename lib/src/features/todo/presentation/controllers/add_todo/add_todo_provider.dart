import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/src/features/todo/models/todo/todo_model.dart';

import 'task_tag_provider.dart';

class AddTaskNotifier extends Notifier {
  final title = TextEditingController();
  final description = TextEditingController();

  final form = GlobalKey<FormState>();

  @override
  build() {}

  void createNewTodo(BuildContext context) {
    if (!form.currentState!.validate()) {
      return;
    }

    final taskTag = ref.read(taskTagProvider);

    final todo = Todo(
      title: title.text.trim(),
      description: description.text.trim(),
      category: taskTag.category,
      date: taskTag.date,
      priority: taskTag.priority,
      time: taskTag.date.toString(),
    );

    //TODO: Add to provider
    context.pop();
  }
}

final addTaskProvider =
    NotifierProvider<AddTaskNotifier, void>(AddTaskNotifier.new);
