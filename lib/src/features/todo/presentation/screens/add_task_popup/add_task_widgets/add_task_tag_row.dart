import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:up_todo/src/utils/helpers/calender_helper_functions.dart';

import '../../../../../../common/widgets/chip/task_chip.dart';
import '../../../controllers/add_task_popup/task_tag_provider.dart';

class AddTaskTagRow extends ConsumerWidget {
  /// Custom widget to display the selected tag
  ///
  /// Displays the Widget based on value in the [TaskTag]
  const AddTaskTagRow({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskTag = ref.watch(taskTagProvider);

    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 8,
      children: [
        if (taskTag.category != null)
          UTaskChip(
              chipName: taskTag.category!.name,
              iconData: IconsaxPlusLinear.tag,
              onTap: () => ref.read(taskTagProvider.notifier).deleteCategory()),
        if (taskTag.priority != null)
          UTaskChip(
            chipName: taskTag.priority!.toString(),
            iconData: IconsaxPlusLinear.flag,
            onTap: () => ref.read(taskTagProvider.notifier).deletePriority(),
          ),
        if (taskTag.date != null)
          UTaskChip(
            chipName:
                UDatetimeHelperFunction.getFormatedDateTime(taskTag.date!),
            iconData: IconsaxPlusLinear.clock_1,
            onTap: () => ref.read(taskTagProvider.notifier).deleteDate(),
          ),
      ],
    );
  }
}
