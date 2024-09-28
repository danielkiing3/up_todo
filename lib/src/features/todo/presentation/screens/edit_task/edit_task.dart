import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:up_todo/src/common/widgets/appbar/app_bar.dart';
import 'package:up_todo/src/features/todo/presentation/screens/edit_task/widgets/edit_task_category.dart';
import 'package:up_todo/src/features/todo/presentation/screens/edit_task/widgets/edit_task_header.dart';
import 'package:up_todo/src/features/todo/presentation/screens/edit_task/widgets/edit_task_time.dart';
import 'package:up_todo/src/utils/constants/colors.dart';
import 'package:up_todo/src/utils/constants/sizes.dart';

import 'widgets/edit_task_action_button.dart';
import 'widgets/edit_task_priority.dart';

class EditTaskScreen extends ConsumerWidget {
  const EditTaskScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: UAppBar(showBackArrow: true),
      body: EditTaskContent(),
    );
  }
}

class EditTaskContent extends ConsumerWidget {
  const EditTaskContent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          EditTaskHeader(),
          SizedBox(height: USizes.md),

          EditTaskTime(),
          EditTaskCategory(),

          // -- Task Priority
          EditTaskPriority(),

          // -- Delete Task
          Row(
            children: [
              SizedBox(width: USizes.smallSpaceBtwItems),
              Icon(
                IconsaxPlusLinear.trash,
                color: UColors.error,
              ),
              SizedBox(width: USizes.smallSpaceBtwItems),
              Text(
                'Delete Task',
                style: TextStyle(color: UColors.error),
              ),
            ],
          ),
          SizedBox(height: USizes.md * 2),

          Spacer(),

          EditTaskActionButton(),
          SizedBox(height: USizes.md * 2),
        ],
      ),
    );
  }
}
