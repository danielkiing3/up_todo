import 'package:up_todo/src/features/todo/models/todo/task_model.dart';

/// -- Abstract class for CRUD operation on Todo database
abstract class DatabaseRepository {
  Future<void> addNewTask(Task todo); // Create
  Future<List<Task>> fetchAllTask(); // Read
  Future<void> updateTask(int index, Task todo); // Update
  Future<void> deleteTask(String id); // Delete
}
