import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../utils/constants/texts.dart';
import '../../../controllers/add_task_popup/choose_date_provider.dart';

class ChooseTimeActionButtons extends ConsumerWidget {
  const ChooseTimeActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        // -- Cancel
        Expanded(
          child: TextButton(
            onPressed: () =>
                ref.read(chooseDateProvider.notifier).cancel(context),
            child: const Text(UTexts.cancel),
          ),
        ),

        // -- Save
        Expanded(
          child: ElevatedButton(
            onPressed: () =>
                ref.read(chooseDateProvider.notifier).save(context),
            child: const Text(UTexts.save),
          ),
        ),
      ],
    );
  }
}
