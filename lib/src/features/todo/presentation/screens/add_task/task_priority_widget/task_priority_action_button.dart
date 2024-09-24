import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/texts.dart';
import '../../../controllers/add_task/choose_priority_provider.dart';

/// Action Button for the Task Priority Dialog
/// Contains
///   - TextButton to [cancel]
///   - ElevatedButton to [save] priority
class TaskPriorityActionButton extends ConsumerWidget {
  /// -- Action Button for the Task Priority Dialog
  const TaskPriorityActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          // -- Cancel Button
          child: TextButton(
            onPressed: () =>
                ref.read(choosePriorityProvider.notifier).cancel(context),
            child: Text(
              UTexts.cancel,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: UColors.buttonPrimary),
            ),
          ),
        ),
        Expanded(
          // -- Save button
          child: ElevatedButton(
            onPressed: () =>
                ref.read(choosePriorityProvider.notifier).save(context),
            style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                backgroundColor:
                    WidgetStateProperty.all(UColors.buttonSecondary)),
            child: const Text(UTexts.save),
          ),
        ),
      ],
    );
  }
}
