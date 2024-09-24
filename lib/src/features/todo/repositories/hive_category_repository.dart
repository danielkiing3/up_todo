import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:up_todo/src/features/todo/models/category/category_model.dart';
import 'package:up_todo/src/features/todo/models/todo/task_model.dart';

/// Repository for Category stored in the Hive Local Storage
class CategoryTodoRepository {
  String categoryBoxName = 'category';

  late Box<Category> _hive;
  late List<Category> _box;

  /// Function to fetch all the todo from the Hive box named []
  Future<List<Category>> fetchAllTask() async {
    _hive = await Hive.openBox<Category>(categoryBoxName);
    _box = _hive.values.toList();

    return _box;
  }

  /// -- Function to add todo to the Category Hive database
  /// The new todo is added to the last index of the box
  Future<void> addNewTask(Category category) async {
    await _hive.add(category);
  }

  /// -- Function to delete todo by Todo id
  Future<void> deleteTask(String id) async {
    await _hive
        .deleteAt(_hive.values.toList().indexWhere((task) => task.id == id));
  }

  /// Function call to update the value of a [Task] at the previous index in Hive
  Future<void> updateTask(int index, Category category) async {
    await _hive.putAt(index, category);
  }

  // Function to delete all values in the Hive box
  Future<void> deleteAllTask() async {
    await _hive.clear();
  }
}

final hiveCategoryRepositoryProvider =
    Provider((ref) => CategoryTodoRepository());
