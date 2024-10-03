import 'package:flutter_riverpod/flutter_riverpod.dart';

final calenederSelectedDateProvider = StateProvider<DateTime>((ref) {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day);
});

// Provider to store the currently displayed month and year
final calenderCurrentMonthProvider = StateProvider<DateTime>((ref) {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day);
});

// Check if today is selected or not
final todayCompletedCalenderProvider =
    StateProvider.autoDispose<bool>((ref) => true);
