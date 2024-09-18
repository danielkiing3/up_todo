import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Task {
  final String id;
  final String title;
  final String? description;
  final DateTime? date; // Might change to datetime type
  final String? time;
  final int? priority;
  final String? categoryId; // Type should be Category model class
  final bool isCompleted;

  Task({
    id,
    required this.title,
    this.description,
    this.date, // Initialize to default been today's date
    this.time,
    this.priority,
    this.categoryId,
    this.isCompleted = false,
  }) : id = id ?? uuid.v1();

  /// Convert the [Task] to a JSON object for storing in Firebase
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Title': title,
      'Description': description,
      'Date': date?.toIso8601String(),
      'Time': time,
      'Priority': priority,
      'Category': categoryId,
      'isCompleted': isCompleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
      title: json['Title'] as String,
      description: json['Description'],
      date: json['Date'],
      time: json['Time'],
      priority: json['Priority'],
      categoryId: json['Category'],
      isCompleted: json['isCompleted'] as bool,
    );
  }
}

// Helper extension used to update values of the todo

extension MutableTodo on Task {
  /// -- Function to update the values of a todo and return a new todo with same id
  Task update({
    String? title,
    String? description,
    DateTime? date,
    String? time,
    int? priority,
    String? categoryId,
  }) {
    return Task(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      time: time ?? this.time,
      priority: priority ?? this.priority,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  /// -- Function to update the state of the Todo on completion state
  Task complete(bool isCompleted) {
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
}
