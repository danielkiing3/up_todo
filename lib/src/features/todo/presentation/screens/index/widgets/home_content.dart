import 'package:flutter/material.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/todo/task_model.dart';
import 'index_dropdown_chip.dart';
import 'index_serach_var.dart';
import 'task_tile.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
    required this.taskList,
  });

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    final activeTasks =
        taskList.where((task) => task.isCompleted == false).toList();
    final completedTasks =
        taskList.where((task) => task.isCompleted == true).toList();

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(
          top: 20,
          left: 10,
          right: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -- Search Container
            IndexSearchBar(onTap: () {}),
            const SizedBox(height: 20),

            // -- Today Tag
            IndexDropdownChip(name: 'Today', onTap: () {}),
            const SizedBox(height: 10),

            // -- Today Task Builder
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 20, maxHeight: 300),
              child: ListView.separated(
                itemCount: activeTasks.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: USizes.md),
                itemBuilder: (context, index) {
                  return TaskTile(task: activeTasks[index]);
                },
              ),
            ),
            const SizedBox(height: 20),

            // -- Completed Tag
            IndexDropdownChip(
                name: 'Completed',
                onTap: () {
                  //TODO: Perform content closing and opening action
                }),
            const SizedBox(height: 10),

            // -- Completed Task Builder
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 20, maxHeight: 300),
              child: ListView.separated(
                itemCount: completedTasks.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: USizes.md),
                itemBuilder: (context, index) {
                  return TaskTile(task: completedTasks[index]);
                },
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
