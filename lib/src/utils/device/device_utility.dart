import 'package:flutter/material.dart';

/// -- Helper function relating to the device
class UDeviceUtils {
  UDeviceUtils._();

  /// -- Get screen heght
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// -- Get screen width
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
