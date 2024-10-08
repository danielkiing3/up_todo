/// Model for each bar of the week of the App usage bar chart overview
class AppUsageBarModel {
  /// Integer value to represent the current day of the week
  final int dayIndex;

  // Floating point value to show the time in [hours] of the particular Bar Rod
  final double usageTime;

  AppUsageBarModel({
    required this.dayIndex,
    required this.usageTime,
  });
}
