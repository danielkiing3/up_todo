import '../category/category_model.dart';

class Todo {
  final String id;
  final String title;
  final String? description;
  final DateTime? date; // Might change to datetime type
  final String? time;
  final int? priority;
  final Category? category; // Type should be Category model class

  Todo({
    // Generate Todo id
    this.id = '',
    required this.title,
    this.description,
    this.date, // Initialize to default been today's date
    this.time,
    this.priority,
    this.category,
  });

  /// Convert the [Todo] to a JSON object for storing in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Title': title,
      'Description': description,
      'Date': date,
      'Time': time,
      'Priority': priority,
      'Category': category,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> json) {
    return Todo(
      id: json['id'] ?? '',
      title: json['Title'] ?? '',
      description: json['Description'] ?? '',
      date: json['Date'] ?? '',
      time: json['Time'] ?? '',
      priority: json['Priority'] ?? '',
      category: json['Category'] ?? '',
    );
  }
}

// Helper extension used to update values of the todo

extension MutableTodo on Todo {
  Todo update({
    String? title,
    String? description,
    DateTime? date,
    String? time,
    int? priority,
    Category? category,
  }) {
    return Todo(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      time: time ?? this.time,
      priority: priority ?? this.priority,
      category: category ?? this.category,
    );
  }
}
