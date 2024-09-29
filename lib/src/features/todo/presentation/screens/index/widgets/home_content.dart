import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:up_todo/src/features/todo/presentation/controllers/index_pill_controllers.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/todo/task_model.dart';
import 'index_dropdown_chip.dart';
import 'index_serach_var.dart';
import 'task_tile.dart';

class HomeContent extends ConsumerWidget {
  const HomeContent({
    super.key,
    required this.taskList,
  });

  final List<Task> taskList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Task List
    final activeTasks =
        taskList.where((task) => task.isCompleted == false).toList();
    final completedTasks =
        taskList.where((task) => task.isCompleted == true).toList();

    // Reading the visibility states
    final showTodayList = ref.watch(todayListVisibilityProvider);
    final showCompletedList = ref.watch(completedListVisibilityProvider);

    // -- Custom Scroll View
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 10,
        right: 10,
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          // -- Search Container
          SliverToBoxAdapter(
            child: IndexSearchBar(onTap: () {}),
          ),

          // -- Uncompleted Section
          if (activeTasks.isNotEmpty) ...[
            SliverToBoxAdapter(
              child: IndexDropdownChip(
                name: 'Uncompleted',
                visible: showTodayList,
                onTap: () =>
                    ref.read(todayListVisibilityProvider.notifier).toggle(),
              ),
            ),
            if (showTodayList)
              SliverList.separated(
                itemCount: activeTasks.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: USizes.md),
                itemBuilder: (context, index) {
                  return TaskTile(task: activeTasks[index]);
                },
              ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
          ],

          // -- Completed section
          if (completedTasks.isNotEmpty) ...[
            SliverToBoxAdapter(
              child: IndexDropdownChip(
                visible: showCompletedList,
                name: 'Completed',
                onTap: () =>
                    ref.read(completedListVisibilityProvider.notifier).toggle(),
              ),
            ),
            if (showCompletedList)
              SliverList.separated(
                itemCount: completedTasks.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: USizes.md),
                itemBuilder: (context, index) {
                  return TaskTile(task: completedTasks[index]);
                },
              ),
          ],

          // -- Space holder
          const SliverToBoxAdapter(
            child: SizedBox(
              height: USizes.biggerSpaceBtwSections,
            ),
          ),
        ],
      ),
    );
  }
}
