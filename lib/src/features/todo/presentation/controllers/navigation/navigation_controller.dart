import 'package:get/get.dart';
import 'package:up_todo/src/features/personalization/screens/profile/profile.dart';
import 'package:up_todo/src/features/todo/presentation/screens/calender/calender.dart';
import 'package:up_todo/src/features/todo/presentation/screens/focus/focus.dart';
import 'package:up_todo/src/features/todo/presentation/screens/index/index.dart';

class NavigationMenuController extends GetxController {
  static NavigationMenuController get instance =>
      Get.find(); // Find the controller and create a static instance of it

  Rx<int> currentPageIndex = 0.obs;

  // THe differene home view
  final screen = [
    const IndexScreen(),
    const CalenderScreen(),
    const FocusScreen(),
    const ProfileScreen(),
  ];

  // Function to update the current page index
  void updateIndex(int index) {
    currentPageIndex.value = index;
  }
}
