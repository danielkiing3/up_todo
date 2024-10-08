import 'dart:async';

import 'package:app_usage/app_usage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:up_todo/src/features/focus/models/app_usage/app_usage_bar_model.dart';

class AppUsageBarChartNotifier extends AsyncNotifier<List<AppUsageBarModel>> {
  @override
  Future<List<AppUsageBarModel>> build() async {
    final currentDate = DateTime.now();
    state = const AsyncLoading();
    final weeklyList = await getWeeklyValue(currentDate);
    state = AsyncData(weeklyList);
    return weeklyList;
  }

  /// Function to get weekly screen time usage from the passed currentDate
  ///
  /// Returns a [List<AppUsageBarModel>]
  Future<List<AppUsageBarModel>> getWeeklyValue(DateTime currentDate) async {
    // Strip the currentDate of it time values
    final suppliedDate =
        DateTime(currentDate.year, currentDate.month, currentDate.day);

    // Get what day of the week if [suppliedDate] is from
    // Sunday = 0, Monday = 1, ..., Saturday = 6
    int dayOfWeek = suppliedDate.weekday % 7;

    // First date of the current
    DateTime firstDateOfWeek = suppliedDate.subtract(Duration(days: dayOfWeek));

    final List<AppUsageBarModel> weeklyList = [];

    // For look for 7 days of the week
    for (int i = 0; i < 7; i++) {
      // App used value in seconds
      int appUsageValue = 0;

      // Current date app usage list
      final dailyAppInfoList = await AppUsage().getAppUsage(
        firstDateOfWeek,
        firstDateOfWeek.add(const Duration(days: 1)),
      );

      for (final appInfo in dailyAppInfoList) {
        appUsageValue += appInfo.usage.inSeconds;
      }

      weeklyList.add(
        AppUsageBarModel(dayIndex: i, usageTime: appUsageValue / 3600),
      );

      // Move to the next day
      firstDateOfWeek = firstDateOfWeek.add(const Duration(days: 1));
    }
    return weeklyList;
  }

  /// Function to update the current weekly value with a new week value
  Future<void> updateWeeklyValue(DateTime date) async {
    state = const AsyncLoading();
    final weeklyList = await getWeeklyValue(date);
    state = AsyncData(weeklyList);
  }
}

final appBarChartProvider =
    AsyncNotifierProvider<AppUsageBarChartNotifier, List<AppUsageBarModel>>(
        AppUsageBarChartNotifier.new);
