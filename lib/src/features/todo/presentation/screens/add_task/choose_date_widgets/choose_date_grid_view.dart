import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/helpers/calender_helper_functions.dart';
import '../../../controllers/add_task/choose_date_provider.dart';

class ChooseDateGridView extends ConsumerWidget {
  const ChooseDateGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);
    final currentMonthYear = ref.watch(currentMonthProvider);

    return GridView.builder(
      // Sliver Grid for the date
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 8,
        crossAxisSpacing: 20,
      ),

      shrinkWrap: true,
      itemCount: 35,
      itemBuilder: (ctx, index) {
        final date =
            UDatetimeHelperFunction.getDateForIndex(index, currentMonthYear);

        // Check if the tab is right month
        final isRightMonth = currentMonthYear.month == date.month;

        return GestureDetector(
          onTap: () {
            if (isRightMonth) {
              ref.read(selectedDateProvider.notifier).state = date;
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: isRightMonth
                  ? date == selectedDate
                      ? UColors.primary
                      : UColors.darkestGrey
                  : null,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
                child: Text(
              date.day.toString(),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: !isRightMonth ? UColors.textSecondary : null),
            )),
          ),
        );
      },
    );
  }
}
