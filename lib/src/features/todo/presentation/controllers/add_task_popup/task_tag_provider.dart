import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:up_todo/src/features/todo/presentation/controllers/add_task_popup/choose_date_provider.dart';
import 'package:up_todo/src/features/todo/presentation/controllers/add_task_popup/choose_priority_provider.dart';

import '../../../models/category/category_model.dart';
import '../../../models/category/category_tag_model.dart';
import 'choose_category_provider.dart';

class TaskTagNotifer extends Notifier<TaskTag> {
  @override
  TaskTag build() {
    return TaskTag();
  }

  void updatePriority(int priority) {
    state = state.updatePriority(priority: priority);
  }

  void clearValues() {
    deletePriority();
    deleteCategory();
    deleteDate();
  }

  void deletePriority() {
    // Reset the choose
    ref.read(choosePriorityProvider.notifier).reset();
    state = state.updatePriority(priority: null);
  }

  void updateCategory(Category category) {
    state = state.updateCategory(category: category);
  }

  void deleteCategory() {
    ref.read(chooseCategoryProvider.notifier).reset();
    state = state.updateCategory(category: null);
  }

  void updateDate(DateTime date) {
    state = state.updateDate(date: date);
  }

  void deleteDate() {
    // Reset selectedDate value to current Date
    ref.read(selectedDateProvider.notifier).update((state) {
      final now = DateTime.now();
      return DateTime(now.year, now.month, now.day);
    });
    state = state.updateDate(date: null);
  }
}

final taskTagProvider =
    NotifierProvider<TaskTagNotifer, TaskTag>(TaskTagNotifer.new);
