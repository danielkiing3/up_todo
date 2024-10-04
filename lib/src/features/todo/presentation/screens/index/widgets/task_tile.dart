import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/src/features/todo/presentation/controllers/edit_task/edit_task_provider.dart';
import 'package:up_todo/src/utils/constants/routes.dart';
import 'package:up_todo/src/utils/helpers/calender_helper_functions.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/todo/task_model.dart';
import '../../../../repositories/category_repository.dart';
import '../../../../services/todo_service_repository.dart';
import 'category_tag.dart';
import 'priority_tag.dart';

/// Custom Widget for the Task Tile
///
/// Contains a check box
/// Renders the [title]
/// COnditioanlly re[description] and other element
class TaskTile extends ConsumerStatefulWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  ConsumerState<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends ConsumerState<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        ref.read(editTaskProvider.notifier).openEditTask(widget.task);
        context.pushNamed(URoutes.editTaskScreen);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.21),
            borderRadius: BorderRadius.circular(USizes.sm)),
        padding: const EdgeInsets.only(
            top: USizes.sm, bottom: USizes.sm, right: USizes.md),
        child: Row(
          children: [
            Checkbox(
              key: ValueKey(widget.task.id),
              shape: const CircleBorder(
                side: BorderSide(width: 5),
              ),
              value: widget.task.isCompleted,
              onChanged: (value) {
                ref
                    .read(todoServiceProvider.notifier)
                    .updateTask(widget.task.complete(value!));
              },
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --Titile
                  Text(
                    widget.task.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),

                  // -- Description
                  if (widget.task.description != null &&
                      widget.task.description!.trim().isNotEmpty)
                    Text(
                      widget.task.description!,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                  // -- Task Tag
                  if (widget.task.date != null ||
                      widget.task.categoryId != null ||
                      widget.task.priority != null)
                    const SizedBox(height: USizes.xs),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // -- Date
                      if (widget.task.date != null)
                        Text(
                          UDatetimeHelperFunction.getFormatedDateTime(
                              widget.task.date!),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: UDatetimeHelperFunction.isOldDate(
                                          widget.task.date!)
                                      ? UColors.error
                                      : UColors.textSecondary),
                        ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // -- Category
                          if (widget.task.categoryId != null)
                            CategoryTag(
                              ref
                                  .read(categoriesRepository.notifier)
                                  .getCategory(widget.task.categoryId!),
                            ),

                          // -- Priority
                          if (widget.task.priority != null) ...[
                            const SizedBox(width: USizes.sm + 6),
                            PriorityTag(priority: widget.task.priority!)
                          ]
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
