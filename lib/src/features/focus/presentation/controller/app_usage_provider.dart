import 'dart:async';

import 'package:android_package_manager/android_package_manager.dart';
import 'package:app_usage/app_usage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:up_todo/src/features/focus/models/app_usage/app_usage_model.dart';

class AppUsageNotifier extends AsyncNotifier<List<AppUsageModel>> {
  @override
  Future<List<AppUsageModel>> build() async {
    DateTime endDate = DateTime.now();
    DateTime startDate = DateTime(endDate.year, endDate.month,
        endDate.day); // Start of the [endDate] in 00H:00M:00S

    state = const AsyncLoading();

    // Getting all info list from [AppUsage] package
    List<AppUsageInfo> appInfoList =
        await AppUsage().getAppUsage(startDate, endDate);

    /// Filter out the app with less than '5' minutes of Screen on time
    /// Maps the [appInfoList] value to create a list of [AppUsageModel]
    List<AppUsageModel> appUsageList = await Future.wait(
      appInfoList
          // Check if the time spend is more than 1 minutes on the app
          .where((appInfo) => appInfo.usage.inMinutes >= 5)
          .map((appInfo) async {
        return AppUsageModel(
          appName: appInfo.appName,
          duration: appInfo.usage,
          appIconByte: await AndroidPackageManager()
              .getApplicationIcon(packageName: appInfo.packageName),
        );
      }).toList(),
    );

    return appUsageList;
  }
}

/// App Usgae Provider
final appUsageProvider =
    AsyncNotifierProvider<AppUsageNotifier, List<AppUsageModel>>(
        AppUsageNotifier.new);
