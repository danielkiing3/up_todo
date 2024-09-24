import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:up_todo/src/features/todo/presentation/controllers/add_task/choose_date_provider.dart';

import '../../../../../../utils/constants/texts.dart';

class ChooseDateActionButtons extends ConsumerWidget {
  const ChooseDateActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        // -- Cancel button
        Expanded(
          child: TextButton(
            onPressed: () =>
                ref.read(chooseDateProvider.notifier).cancel(context),
            child: const Text(UTexts.cancel),
          ),
        ),

        // - Choose time button
        Expanded(
            child: ElevatedButton(
          onPressed: () =>
              ref.read(chooseDateProvider.notifier).chooseTime(context),
          child: const Text(UTexts.chooseTime),
        ))
      ],
    );
  }
}
