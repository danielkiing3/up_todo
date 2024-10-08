import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:up_todo/src/features/todo/presentation/controllers/edit_task/edit_task_provider.dart';
import 'package:up_todo/src/features/todo/presentation/screens/add_task_popup/add_task_popup.dart';
import 'package:up_todo/src/features/todo/presentation/screens/edit_task/edit_task.dart';
import 'package:up_todo/src/features/todo/presentation/screens/index/widgets/task_alert_dialog.dart';
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
  /// Dismissible background widget
  Widget slideLeftBackground() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(USizes.sm),
        color: UColors.error,
      ),
      child: const Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(IconsaxPlusLinear.trash),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.task.id),
      background: slideLeftBackground(),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        await showDialog(
          context: context,
          builder: (context) {
            return TaskAlertDialog(
              title: widget.task.title,
              taskId: widget.task.id,
            );
          },
        );
        return null;
      },
      child: GestureDetector(
        onTap: () {
          ref.read(editTaskProvider.notifier).openEditTask(widget.task);
          if (Platform.isAndroid) {
            context.pushNamed(URoutes.editTaskScreen);
          }

          if (Platform.isIOS) {
            TaskBottomSheet.iosBottomSheet(context);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: UColors.bottomSheetPrimary,
            borderRadius: BorderRadius.circular(USizes.sm),
          ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // -- Date
                        if (widget.task.date != null)
                          Flexible(
                            child: Text(
                              UDatetimeHelperFunction.getFormatedDateTime(
                                  widget.task.date!),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: UDatetimeHelperFunction.isOldDate(
                                            widget.task.date!)
                                        ? UColors.error
                                        : UColors.textSecondary,
                                  ),
                            ),
                          ),
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
                            ],
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
      ),
    );
  }
}
