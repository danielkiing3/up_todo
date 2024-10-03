import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:up_todo/src/features/todo/models/todo/task_model.dart';
import 'package:up_todo/src/features/todo/presentation/controllers/calender/calender_selected_date_provider.dart';
import 'package:up_todo/src/features/todo/services/todo_service_repository.dart';

final filteredTasksProvider = Provider<Map<bool, List<Task>>>((ref) {
  final selectedDate = ref.watch(calenederSelectedDateProvider);
  final todos = ref.watch(todoServiceProvider);

  final filteredTasks = {
    true: <Task>[],
    false: <Task>[],
  };

  todos.whenData(
    (List<Task> tasks) {
      for (final task in tasks) {
        if (task.date?.year == selectedDate.year &&
            task.date?.month == selectedDate.month &&
            task.date?.day == selectedDate.day) {
          if (task.isCompleted) {
            filteredTasks[false]!.add(task);
          } else {
            filteredTasks[true]!.add(task);
          }
        }
      }
    },
  );

  return filteredTasks;
});
