import 'package:flutter/material.dart';

import 'task_priority_tag.dart';

/// Grid view showing priority tag for the Task Priority Diolog
class TaskPriorityGridView extends StatelessWidget {
  /// Grid view showing priority tag for the Task Priority Diolog
  ///
  /// Uses a GridView builder to render the UI
  const TaskPriorityGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        final value = index + 1;

        return TaskPriorityTag(value: value);
      },
    );
  }
}
