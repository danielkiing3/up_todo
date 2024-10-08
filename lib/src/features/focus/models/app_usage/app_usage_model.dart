import 'dart:typed_data';

/// Model for the individual app usage on your mobile devie
class AppUsageModel {
  /// Name of the app
  final String appName;

  /// 8-bit value of app icon
  final Uint8List? appIconByte;

  /// Duration spent of the specific app
  final Duration duration;

  AppUsageModel({
    required this.appName,
    required this.appIconByte,
    required this.duration,
  });
}
