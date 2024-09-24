import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:up_todo/src/features/todo/models/category/category_model.dart';
import 'package:up_todo/src/features/todo/repositories/hive_category_repository.dart';

final categories = [
  Category(
      id: '1',
      name: 'Grocecy',
      icon: IconsaxPlusLinear.folder_open,
      iconColor: const Color.fromARGB(255, 33, 163, 0)),
  Category(
      id: '2',
      name: 'Work',
      icon: IconsaxPlusLinear.briefcase,
      iconColor: const Color.fromARGB(255, 163, 29, 0)),
  Category(
      id: '3',
      name: 'Sport',
      icon: IconsaxPlusLinear.magic_star,
      iconColor: const Color.fromARGB(255, 0, 163, 47)),
  Category(
    name: 'Design',
    id: '4',
    icon: IconsaxPlusLinear.game,
    iconColor: const Color.fromARGB(255, 0, 163, 114),
  ),
  Category(
    id: '5',
    name: 'University',
    icon: IconsaxPlusLinear.book,
    iconColor: const Color.fromARGB(255, 0, 85, 163),
  ),
  Category(
    id: '6',
    name: 'Social',
    icon: IconsaxPlusLinear.speaker,
    iconColor: const Color.fromARGB(255, 163, 0, 137),
  ),
  Category(
    id: '7',
    name: 'Music',
    icon: IconsaxPlusLinear.music,
    iconColor: const Color.fromARGB(255, 160, 0, 163),
  ),
  Category(
    id: '8',
    name: 'Health',
    icon: IconsaxPlusLinear.health,
    iconColor: const Color.fromARGB(255, 0, 163, 163),
  ),
  Category(
    id: '9',
    name: 'Movie',
    icon: IconsaxPlusLinear.filter,
    iconColor: const Color.fromARGB(255, 0, 105, 163),
  ),
  Category(
    id: '10',
    name: 'Home',
    icon: IconsaxPlusLinear.home,
    iconColor: const Color.fromARGB(255, 163, 98, 0),
  ),
];

final createNewCategory = Category(
  id: '100',
  name: 'Create New',
  icon: IconsaxPlusLinear.add,
  iconColor: const Color.fromARGB(255, 0, 163, 105),
  isCreateNewButton: true,
);

final categoriesRepository =
    AsyncNotifierProvider<CategoriesNotifier, List<Category>>(
        CategoriesNotifier.new);

class CategoriesNotifier extends AsyncNotifier<List<Category>> {
  @override
  Future<List<Category>> build() async {
    // Initial update of the repo state
    state = AsyncData([...categories, createNewCategory]);

    // Access the local database
    final hiveCategory =
        await ref.read(hiveCategoryRepositoryProvider).fetchAllTask();

    return [...categories, ...hiveCategory, createNewCategory];
  }

  /// Add new category to the repository
  void addCategory(Category category) async {
    // Make a copy of the old state
    final oldState = state.value!;

    // Insert the new category at the second to last index
    oldState.insert(oldState.length - 1, category);

    // Update the state
    state = AsyncData(oldState);

    // Add the new category to the Hive Category db
    await ref.read(hiveCategoryRepositoryProvider).addNewTask(category);
  }

  /// Generate category from Category id
  Category getCategory(String id) {
    final generatedCategory = state.value!.firstWhere((cat) => cat.id == id);
    return generatedCategory;
  }
}

/// Load newly added [Category] from memory when app relaunches
