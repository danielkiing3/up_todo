import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:up_todo/src/features/todo/models/category/category_model.dart';

final categories = [
  Category(
      name: 'Grocecy',
      icon: IconsaxPlusLinear.folder_open,
      iconColor: Colors.green),
  Category(
      name: 'Work',
      icon: IconsaxPlusLinear.briefcase,
      iconColor: Colors.indigo),
  Category(
      name: 'Sport',
      icon: IconsaxPlusLinear.magic_star,
      iconColor: Colors.blue),
  Category(
      name: 'Design', icon: IconsaxPlusLinear.game, iconColor: Colors.teal),
  Category(
      name: 'University',
      icon: IconsaxPlusLinear.book,
      iconColor: Colors.deepPurple),
  Category(
    name: 'Social',
    icon: IconsaxPlusLinear.speaker,
    iconColor: Colors.pink,
  ),
  Category(
      name: 'Music', icon: IconsaxPlusLinear.music, iconColor: Colors.blueGrey),
  Category(
    name: 'Health',
    icon: IconsaxPlusLinear.health,
    iconColor: Colors.brown,
  ),
  Category(
    name: 'Movie',
    icon: IconsaxPlusLinear.filter,
    iconColor: const Color.fromARGB(255, 0, 105, 163),
  ),
  Category(
    name: 'Home',
    icon: IconsaxPlusLinear.home,
    iconColor: const Color.fromARGB(255, 163, 98, 0),
  ),
];

final createNewCategory = Category(
  name: 'Create New',
  icon: IconsaxPlusLinear.add,
  iconColor: Colors.green,
  isCreateNewButton: true,
);

final categoriesRepository =
    NotifierProvider<CategoriesNotifier, List<Category>>(
        CategoriesNotifier.new);

class CategoriesNotifier extends Notifier<List<Category>> {
  @override
  List<Category> build() {
    return [...categories, createNewCategory];
  }

  /// Add new category to the repository
  void addCategory(Category category) {
    final oldState = state;
    oldState.insert(-1, category);
    state = oldState;
  }
}

/// Load newly added [Category] from memory when app relaunches
