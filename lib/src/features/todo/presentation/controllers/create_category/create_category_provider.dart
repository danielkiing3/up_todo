import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:up_todo/src/features/todo/models/category/category_model.dart';
import 'package:up_todo/src/features/todo/repositories/category_repository.dart';

final createNewCategoryProvider =
    NotifierProvider<CreateNewCategoryProvider, void>(
        CreateNewCategoryProvider.new);

final selecteCategoryColorProvider = StateProvider<Color?>((ref) => null);

final selectedCategoryIconProvider = StateProvider<IconData?>((ref) => null);

class CreateNewCategoryProvider extends Notifier {
  final name = TextEditingController();
  final categoryForm = GlobalKey<FormState>();

  @override
  build() {}

  void createNewCategory(BuildContext context) {
    // Check if form is validate
    // if (!categoryForm.currentState!.validate()) {
    //   return;
    // }

    // Check if color has been selected
    final color = ref.read(selecteCategoryColorProvider);
    if (color == null) {
      return;
    }

    // Check if color has been selected
    // final icon = ref.read(selectedCategoryIconProvider);
    // if (icon == null) {
    //   return;
    // }

    final id = ref.read(categoriesRepository).value!.length;

    final newCategory = Category(
      id: '$id + 1',
      name: name.text.trim(),
      icon: IconsaxPlusLinear.activity,
      iconColor: color,
    );

    ref.read(categoriesRepository.notifier).addCategory(newCategory);

    // Reset values
    resetValue();

    // Pop screen
    context.pop();
  }

  void cancel(BuildContext context) {
    resetValue();

    // Pop screen
    context.pop();
  }

  // Reset value of the providers and text editing controller
  void resetValue() {
    // Clear name field
    name.clear();

    // Reset icon provider
    ref.read(selectedCategoryIconProvider.notifier).state = null;

    // Reset color provider
    ref.read(selecteCategoryColorProvider.notifier).state = null;
  }
}
