import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:up_todo/src/features/todo/repositories/hive_todo_repository.dart';

import '../models/todo/todo_model.dart';

final todoServiceProvider =
    AsyncNotifierProvider<TodoServiceNotifier, List<Todo>>(
        TodoServiceNotifier.new);

class TodoServiceNotifier extends AsyncNotifier<List<Todo>> {
  @override
  Future<List<Todo>> build() async {
    // Indicate the laoding state
    state = const AsyncLoading();

    // Loading the date from the Hive local db
    final loadedState =
        await ref.read(hiveTodoRepositoryProvider).fetchAllTask();
    // Set the state to the loaded data
    state = AsyncData(loadedState);

    return loadedState;
  }

  Future<void> addNewTask(Todo todo) async {
    final oldValue = [...?state.value, todo];
    state = AsyncData(oldValue);

    //TODO: Explore the option of using Isolates
    // Update the local Hive repo
    await ref.read(hiveTodoRepositoryProvider).addNewTask(todo);

    // Update remote db
  }

  Future<void> deleteTask(String todoId) async {
    // TODO: Handle race condition in case another async function is going on
    final oldValue = [...?state.value?.where((todo) => todo.id != todoId)];

    state = AsyncData(oldValue);

    // Uodate the local Hive repo
    await ref.read(hiveTodoRepositoryProvider).deleteTask(todoId);
  }

  Future<void> updateTask(Todo todo) async {
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
