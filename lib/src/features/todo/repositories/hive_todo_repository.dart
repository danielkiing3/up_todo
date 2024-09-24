import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:up_todo/src/features/todo/models/todo/task_model.dart';
import 'package:up_todo/src/features/todo/repositories/abstract/abstract_databse_repo.dart';

/// Repository for Todo stored in the Hive Local Storage
class HiveTodoRepository extends DatabaseRepository {
  String todoBoxName = 'todoBox';

  late Box<Task> _hive;
  late List<Task> _box;

  /// Function to fetch all the todo from the Hive box named [todoBoxName]
  @override
  Future<List<Task>> fetchAllTask() async {
    _hive = await Hive.openBox<Task>(todoBoxName);
    _box = _hive.values.toList();

    return _box;
  }

  /// -- Function to add todo to the Todo Hive database
  /// The new todo is added to the last index of the box
  @override
  Future<void> addNewTask(Task task) async {
    await _hive.add(task);
  }

  /// -- Function to delete todo by Todo id
  @override
  Future<void> deleteTask(String id) async {
    await _hive
        .deleteAt(_hive.values.toList().indexWhere((task) => task.id == id));
  }

  /// Function call to update the value of a [Task] at the previous index in Hive
  @override
  Future<void> updateTask(int index, Task task) async {
    await _hive.putAt(index, task);
  }

  // Function to delete all values in the Hive box
  @override
  Future<void> deleteAllTask() async {
    await _hive.clear();
  }
}

final hiveTodoRepositoryProvider = Provider((ref) => HiveTodoRepository());
