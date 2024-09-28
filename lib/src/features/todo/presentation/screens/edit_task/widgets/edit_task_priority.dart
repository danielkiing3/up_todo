import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../../common/widgets/action_chip/action_chip.dart';
import '../../../controllers/edit_task/edit_task_provider.dart';
import 'edit_task_row.dart';

class EditTaskPriority extends ConsumerWidget {
  const EditTaskPriority({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final priority = ref.watch(priorityEditProvider);

    return EditTaskRow(
      name: 'Task Priority:',
      icon: IconsaxPlusLinear.tag,
      actionChip: UActionChip(
        onTap: () {},
        content: Text(priority != null ? priority.toString() : 'Empty'),
      ),
    );
  }
}
