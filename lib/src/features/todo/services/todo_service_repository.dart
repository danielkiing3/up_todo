import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:up_todo/src/features/todo/repositories/hive_todo_repository.dart';

import '../models/todo/task_model.dart';

final todoServiceProvider =
    AsyncNotifierProvider<TodoServiceNotifier, List<Task>>(
        TodoServiceNotifier.new);

class TodoServiceNotifier extends AsyncNotifier<List<Task>> {
  @override
  Future<List<Task>> build() async {
    // Indicate the laoding state
    state = const AsyncLoading();

    // Loading the date from the Hive local db
    final loadedState =
        await ref.read(hiveTodoRepositoryProvider).fetchAllTask();
    // Set the state to the loaded data

    /// TODO: Testing the app new shimmer effect
    // await Future.delayed(const Duration(seconds: 10)).then((val) {});

    state = AsyncData(loadedState);

    return loadedState;
  }

  Future<void> addNewTask(Task todo) async {
    final oldValue = [...?state.value, todo];
    state = AsyncData(oldValue);

    // Update the local Hive repo
    await ref.read(hiveTodoRepositoryProvider).addNewTask(todo);
  }

  Future<void> deleteTask(String todoId) async {
    final oldValue = [...?state.value?.where((todo) => todo.id != todoId)];

    state = AsyncData(oldValue);

    // Uodate the local Hive repo
    await ref.read(hiveTodoRepositoryProvider).deleteTask(todoId);
  }

  Future<void> updateTask(Task todo) async {
    final oldValue = [...?state.value];
    // Getting the todo index in the state value
    final index =
        oldValue.indexWhere((todoElement) => todoElement.id == todo.id);

    // Update the todo in the state
    oldValue[index] = todo;

    state = AsyncData(oldValue);

    // Uodate the local Hive repo
    await ref.read(hiveTodoRepositoryProvider).updateTask(index, todo);
  }
}
