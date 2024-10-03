import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:up_todo/src/features/todo/presentation/controllers/calender/calender_selected_date_provider.dart';
import 'package:up_todo/src/utils/helpers/calender_helper_functions.dart';

class CalenderDatePickerHeader extends ConsumerWidget {
  const CalenderDatePickerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMonthYear = ref.watch(calenderCurrentMonthProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // -- Back
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () =>
                ref.read(calenderCurrentMonthProvider.notifier).update(
                      (state) =>
                          DateTime(state.year, state.month, state.day - 7),
                    ),
            icon: const Icon(IconsaxPlusLinear.arrow_left_3),
          ),
        ),
        // Month and Date
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Month
            Text(UDatetimeHelperFunction.getNameMonth(currentMonthYear.month)),
            // Year
            Text(
              currentMonthYear.year.toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),

        // Forward Button
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: IconButton(
              onPressed: () =>
                  ref.read(calenderCurrentMonthProvider.notifier).update(
                        (state) =>
                            DateTime(state.year, state.month, state.day + 7),
                      ),
              icon: const Icon(IconsaxPlusLinear.arrow_right_1)),
        ),
      ],
    );
  }
}
