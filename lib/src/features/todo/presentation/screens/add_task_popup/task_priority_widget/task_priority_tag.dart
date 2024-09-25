import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../controllers/add_task_popup/choose_priority_provider.dart';

/// Widget for the individal tag on the Task Priority Dialog
class TaskPriorityTag extends ConsumerWidget {
  /// Individual tag for Task Priority Dialog
  /// Contains:
  ///   - Icon
  ///   - Text(Value of tag)
  const TaskPriorityTag({
    super.key,
    required this.value,
  });

  final int value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(choosePriorityProvider);

    return GestureDetector(
      onTap: () => ref.read(choosePriorityProvider.notifier).update(value),
      child: Container(
        padding: const EdgeInsets.all(USizes.xs),
        decoration: BoxDecoration(
          color: state == value ? UColors.buttonSecondary : UColors.darkestGrey,
          borderRadius: BorderRadius.circular(USizes.xs),
        ),
        child: Center(
          child: Column(
            children: [
              const Icon(IconsaxPlusLinear.flag),
              const SizedBox(height: USizes.sm),
              Text((value).toString()),
            ],
          ),
        ),
      ),
    );
  }
}
