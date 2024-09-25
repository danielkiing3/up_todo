import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/src/features/todo/presentation/controllers/add_task_popup/choose_time_provider.dart';
import 'package:up_todo/src/features/todo/presentation/controllers/add_task_popup/task_tag_provider.dart';
import 'package:up_todo/src/features/todo/presentation/screens/add_task_popup/add_task_popup.dart';

class DateNotifier extends Notifier<DateTime?> {
  @override
  DateTime? build() {
    return null;
  }

  void save(BuildContext context) {
    // Check if the selected value is "PM"
    bool isPM =
        ref.read(chooseTimeProvider.notifier).amPmController.selectedItem == 1;

    // Read hour and minute value from controller
    int hour =
        ref.read(chooseTimeProvider.notifier).hourController.selectedItem;
    final minute =
        ref.read(chooseTimeProvider.notifier).minuteController.selectedItem;

    // Condtionally add 12 hours if the time selected is Pm
    if (isPM) {
      hour += 12;
    }

    // Get date value from the choose date picker
    final previousDate = ref.read(selectedDateProvider);
    state = DateTime(
      previousDate.year,
      previousDate.month,
      previousDate.day,
      hour,
      minute,
    );
    ref.read(taskTagProvider.notifier).updateDate(state!);

    // Pop screen
    context.pop();
  }

  void chooseTime(BuildContext context) {
    // Pop screen
    context.pop();

    TaskBottomSheet.showTimeDialog(context);
  }

  void cancel(BuildContext context) {
    // Pop screen
    context.pop();

    // Destroy the choose time provider
    ref.invalidate(chooseTimeProvider);

    // Reset selected date provider
    ref.read(selectedDateProvider.notifier).update((state) {
      final now = DateTime.now();
      return DateTime(now.year, now.month, now.day);
    });
  }
}

final chooseDateProvider =
    NotifierProvider<DateNotifier, DateTime?>(DateNotifier.new);

final selectedDateProvider = StateProvider<DateTime>((ref) {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day);
});

// Provider to store the currently displayed month and year
final currentMonthProvider = StateProvider<DateTime>((ref) {
  final now = DateTime.now();
  return DateTime(now.year, now.month, 1);
});
