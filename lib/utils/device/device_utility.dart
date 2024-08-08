import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

/// -- Helper function relating to the device
class UDeviceUtils {
  UDeviceUtils._();

  /// -- Get screen heght
  static double getScreenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  /// -- Get screen width
  static double getScreenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }
}
