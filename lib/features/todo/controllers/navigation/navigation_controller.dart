import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:up_todo/features/todo/screens/index/index.dart';

class NavigationMenuController extends GetxController {
  static NavigationMenuController get instance => Get.find();

  Rx<int> currentPageIndex = 0.obs;

  final screen = [
    const IndexScreen(),
    Container(color: Colors.green, child: const Center()),
    Container(color: Colors.purple, child: const Center()),
    Container(color: Colors.yellow, child: const Center()),
  ];

  void updateIndex(int index) {
    currentPageIndex.value = index;
  }
}
