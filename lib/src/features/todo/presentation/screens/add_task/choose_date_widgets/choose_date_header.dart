import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../../utils/helpers/calender_helper_functions.dart';
import '../../../controllers/add_task/choose_date_provider.dart';

class ChooseDateHeader extends ConsumerWidget {
  const ChooseDateHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMonthYear = ref.watch(currentMonthProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Back Button
        IconButton(
            onPressed: () => ref
                .read(currentMonthProvider.notifier)
                .update((state) => DateTime(state.year, state.month - 1, 1)),
            icon: const Icon(IconsaxPlusLinear.arrow_left_3)),

        // Month and Date
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Month
            Text(UCalenderHelperFunction.getNameMonth(currentMonthYear.month)),
            // Year
            Text(
              currentMonthYear.year.toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),

        // Forward Button
        IconButton(
            onPressed: () => ref
                .read(currentMonthProvider.notifier)
                .update((state) => DateTime(state.year, state.month + 1, 1)),
            icon: const Icon(IconsaxPlusLinear.arrow_right_1)),
      ],
    );
  }
}
