import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:up_todo/src/common/widgets/action_chip/action_chip.dart';
import 'package:up_todo/src/features/todo/presentation/controllers/edit_task/edit_task_provider.dart';
import 'package:up_todo/src/features/todo/presentation/screens/edit_task/widgets/edit_task_row.dart';
import 'package:up_todo/src/utils/helpers/calender_helper_functions.dart';

class EditTaskTime extends ConsumerWidget {
  const EditTaskTime({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(timeEditProvider);

    return EditTaskRow(
      icon: IconsaxPlusLinear.timer_1,
      name: 'Task Time:',
      actionChip: UActionChip(
        onTap: () {},
        content: Text(
          time != null
              ? UDatetimeHelperFunction.getFormatedDateTime(time)
              : 'Empty Time',
        ),
      ),
    );
  }
}
