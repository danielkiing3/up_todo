import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:up_todo/src/features/todo/presentation/controllers/calender/calender_selected_date_provider.dart';
import 'package:up_todo/src/features/todo/presentation/controllers/calender/filtered_todo_provider.dart';
import 'package:up_todo/src/features/todo/presentation/screens/calender/widgets/calender_date_header_body.dart';
import 'package:up_todo/src/features/todo/presentation/screens/calender/widgets/today_completed_calender_container.dart';
import 'package:up_todo/src/features/todo/presentation/screens/index/widgets/task_tile.dart';
import 'package:up_todo/src/utils/constants/sizes.dart';

class CalenderScreen extends ConsumerWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredTask = ref.watch(filteredTasksProvider);
    final isToday = ref.watch(todayCompletedCalenderProvider);

    final tasks = filteredTask[isToday];

    return Scaffold(
      body: Scrollbar(
        child: CustomScrollView(
          slivers: [
            // -- App Bar
            const SliverAppBar(
              title: Center(child: Text('Calender')),
              backgroundColor: Colors.black,
              bottom: CalenderDateHeaderBody(),
              pinned: true,
            ),

            // -- Today and Completed Tab
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(USizes.smallDefaultSpace),
                child: TodayCompletedCalenderContainer(),
              ),
            ),

            // -- Task Contenet
            tasks!.isNotEmpty
                ? SliverList.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: USizes.smallDefaultSpace),
                        child: TaskTile(task: tasks[index]),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: USizes.md),
                    itemCount: tasks.length,
                  )
                : const SliverFillRemaining(
                    child: Center(
                      child: Text('Nothing to be seen here '),
                    ),
                  ),

            const SliverToBoxAdapter(
                child: SizedBox(
              height: 60,
            )),
          ],
        ),
      ),
    );
  }
}
