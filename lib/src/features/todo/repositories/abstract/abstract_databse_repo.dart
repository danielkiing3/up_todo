import 'package:up_todo/src/features/todo/models/todo/todo_model.dart';

/// -- Abstract class for CRUD operation on Todo database
abstract class DatabaseRepository {
  Future<void> addNewTask(Todo todo); // Create
  Future<List<Todo>> fetchAllTask(); // Read
  Future<void> updateTask(int index, Todo todo); // Update
  Future<void> deleteTask(String id); // Delete
}
