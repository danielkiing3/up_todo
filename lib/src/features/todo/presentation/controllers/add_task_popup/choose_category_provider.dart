import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/src/features/todo/presentation/controllers/edit_task/edit_task_provider.dart';

import '../../../models/category/category_model.dart';
import 'task_tag_provider.dart';

class ChooseCategoryNotifier extends Notifier<Category?> {
  @override
  Category? build() {
    return null;
  }

  void reset() {
    state = null;
  }

  void update(Category value) {
    if (value.isCreateNewButton == false) {
      state = value;
    }
  }

  void populateValue(Category? category) {}

  void editCategory(BuildContext context) {
    // Check if a Category was selected
    if (state != null) {
      // Update the [taskTagProvider] and pop dialog
      ref.read(categoryEditProvider.notifier).state = state!.id;
      context.pop();
    } else {
      //TODO: SHow some error dialog
    }
  }

  void addCategory(BuildContext context) {
    // Check if a Category was selected
    if (state != null) {
      // Update the [taskTagProvider] and pop dialog
      ref.read(taskTagProvider.notifier).updateCategory(state!);
      context.pop();
    } else {
      //TODO: SHow some error dialog
    }
  }
}

final chooseCategoryProvider =
    NotifierProvider<ChooseCategoryNotifier, Category?>(
        ChooseCategoryNotifier.new);
