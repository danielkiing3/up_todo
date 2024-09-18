import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../utils/constants/texts.dart';
import '../../../controllers/add_task/choose_category_provider.dart';

/// Custom action button widget for the Choose Category Dialog
class ChooseCategoryActionButton extends ConsumerWidget {
  /// Custom action button widget for the Choose Category Dialog
  ///
  /// Interact with the [chooseCategoryProvider] when pressed
  const ChooseCategoryActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () =>
            ref.read(chooseCategoryProvider.notifier).addCategory(context),
        child: const Text(UTexts.addCategory),
      ),
    );
  }
}
