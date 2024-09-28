import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:up_todo/src/features/todo/models/todo/task_model.dart';
import 'package:up_todo/src/features/todo/services/todo_service_repository.dart';

final titleEditProvider = StateProvider<String>((ref) => '');

final descriptionEditProvider = StateProvider<String?>((ref) => null);

final checkBoxEditProvider = StateProvider<bool>((ref) => false);

final timeEditProvider = StateProvider<DateTime?>((ref) => null);

final categoryEditProvider = StateProvider<String?>((ref) => null);

final priorityEditProvider = StateProvider<int?>((ref) => null);

final currentEditProvider = StateProvider<Task>((ref) => Task(title: ''));

final editTaskProvider =
    NotifierProvider<EditTaskNotifier, void>(EditTaskNotifier.new);

class EditTaskNotifier extends Notifier {
  @override
  build() {}

  void openEditTask(Task task) {
    ref.read(currentEditProvider.notifier).state = task;

    // Update value providers
    ref.read(titleEditProvider.notifier).state = task.title;
    ref.read(descriptionEditProvider.notifier).state = task.description;
    ref.read(checkBoxEditProvider.notifier).state = task.isCompleted;
    ref.read(timeEditProvider.notifier).state = task.date;
    ref.read(categoryEditProvider.notifier).state = task.categoryId;
    ref.read(priorityEditProvider.notifier).state = task.priority;
  }

  void saveEditTask() {
    // Retrieve old state of [Task]
    final previousTask = ref.watch(currentEditProvider);

    // Update the task with the latest version
    previousTask.update(
      description: ref.read(descriptionEditProvider),
      date: ref.read(timeEditProvider),
      priority: ref.read(priorityEditProvider),
      title: ref.read(titleEditProvider),
      categoryId: ref.read(categoryEditProvider),
    );

    // Update the todo service service
    ref.read(todoServiceProvider.notifier).updateTask(previousTask);
  }
}
