import 'package:hive_flutter/hive_flutter.dart';
import 'package:up_todo/src/features/todo/models/todo/task_model.dart';

class TaskModelAdapter extends TypeAdapter<Task> {
  @override
  int get typeId => 1;

  @override
  Task read(BinaryReader reader) {
    final id = reader.readString();
    final title = reader.readString();
    final description = reader.read() as String?;
    final date = reader.read() as DateTime?;
    final time = reader.read() as String?;
    final priority = reader.read() as int?;
    final categoryId = reader.read() as String?;
    final isCompleted = reader.readBool();

    return Task(
      id: id,
      title: title,
      description: description,
      date: date,
      time: time,
      priority: priority,
      categoryId: categoryId,
      isCompleted: isCompleted,
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeString(obj.id) // Id
      ..writeString(obj.title) // Title
      ..write(obj.description) // Description
      ..write(obj.date) // Date
      ..write(obj.time) // Time
      ..write(obj.priority) //Priority
      ..write(obj.categoryId) // Category Id
      ..writeBool(obj.isCompleted); // IsCompleted
  }
}
