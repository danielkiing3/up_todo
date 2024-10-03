import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:up_todo/src/features/todo/presentation/controllers/calender/calender_selected_date_provider.dart';
import 'package:up_todo/src/utils/constants/colors.dart';
import 'package:up_todo/src/utils/helpers/calender_helper_functions.dart';

class CalenderDateContainer extends ConsumerWidget {
  const CalenderDateContainer(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(calenederSelectedDateProvider);
    final currentMonthYear = ref.watch(calenderCurrentMonthProvider);
    final date = UDatetimeHelperFunction.getCalenderDateFromIndex(
        index, currentMonthYear);
    final currentDate = UDatetimeHelperFunction.getNameDay(index);

    return GestureDetector(
      onTap: () =>
          ref.read(calenederSelectedDateProvider.notifier).state = date,
      child: Container(
        decoration: BoxDecoration(
          color: date == selectedDate ? UColors.primary : UColors.darkestGrey,
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.all(8),
        // margin: ,
        child: Column(
          children: [
            Text(
              currentDate,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: currentDate == 'SUN' || currentDate == 'SAT'
                      ? UColors.error
                      : null),
            ),
            const SizedBox(height: 10),
            Text(date.day.toString())
          ],
        ),
      ),
    );
  }
}
