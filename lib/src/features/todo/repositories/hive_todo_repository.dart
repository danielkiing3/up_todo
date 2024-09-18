import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:up_todo/src/features/todo/models/todo/todo_model.dart';
import 'package:up_todo/src/features/todo/repositories/abstract/abstract_databse_repo.dart';

class HiveTodoRepository extends DatabaseRepository {
  String todoBoxName = 'todoBox';

  late Box<Todo> _hive;
  late List<Todo> _box;

  /// Function to fetch all the todo from the Hive box named [todoBoxName]
  @override
  Future<List<Todo>> fetchAllTask() async {
    _hive = await Hive.openBox<Todo>(todoBoxName);
    _box = _hive.values.toList();

    return _box;
  }

  /// -- Function to add todo to the Todo Hive database
  /// The new todo is added to the last index of the box
  @override
  Future<void> addNewTask(Todo todo) async {
    await _hive.add(todo);
  }

  // -- Function to delete todo by Todo id
  @override
  Future<void> deleteTask(String id) async {
    await _hive
        .deleteAt(_hive.values.toList().indexWhere((todo) => todo.id == id));
  }

  @override
  Future<void> updateTask(int index, Todo todo) async {
    await _hive.putAt(index, todo);
  }
}

final hiveTodoRepositoryProvider = Provider((ref) => HiveTodoRepository());
