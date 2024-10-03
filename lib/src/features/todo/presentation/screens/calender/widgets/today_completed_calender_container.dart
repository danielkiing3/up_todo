import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:up_todo/src/features/todo/presentation/controllers/calender/calender_selected_date_provider.dart';
import 'package:up_todo/src/utils/constants/colors.dart';

class TodayCompletedCalenderContainer extends StatelessWidget {
  const TodayCompletedCalenderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: UColors.darkGrey),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      child: const Row(
        children: [
          Expanded(child: CalenderTodayCompletedButton(true)),
          SizedBox(width: 30),
          Expanded(child: CalenderTodayCompletedButton(false)),
        ],
      ),
    );
  }
}

class CalenderTodayCompletedButton extends ConsumerWidget {
  const CalenderTodayCompletedButton(
    this.isToday, {
    super.key,
  });

  final bool isToday;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(todayCompletedCalenderProvider) == isToday;

    return InkWell(
      onTap: () => ref
          .read(todayCompletedCalenderProvider.notifier)
          .update((state) => state = isToday),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? UColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: isSelected ? Colors.transparent : UColors.borderPrimary,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Center(child: Text(isToday ? "Today" : "Completed")),
      ),
    );
  }
}
