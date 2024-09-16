import 'package:up_todo/src/features/todo/models/category/category_model.dart';

class TaskTag {
  final int? priority;
  final Category? category;
  final DateTime? date;

  TaskTag({
    this.priority,
    this.category,
    this.date,
  });
}

extension MutableCategoryTag on TaskTag {
  TaskTag updatePriority({int? priority}) {
    return TaskTag(
      priority: priority,
      category: category,
      date: date,
    );
  }

  TaskTag updateCategory({Category? category}) {
    return TaskTag(
      priority: priority,
      category: category,
      date: date,
    );
  }

  TaskTag updateDate({DateTime? date}) {
    return TaskTag(
      priority: priority,
      category: category,
      date: date,
    );
  }
}
