import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChooseTimeNotifier extends Notifier {
  final now = DateTime.now();

  late FixedExtentScrollController hourController;
  late FixedExtentScrollController minuteController;
  late FixedExtentScrollController amPmController;

  @override
  void build() {
    bool isAm = now.hour / 12 >= 1;

    hourController = FixedExtentScrollController(initialItem: now.hour % 12);
    minuteController = FixedExtentScrollController(initialItem: now.minute);
    amPmController = FixedExtentScrollController(initialItem: isAm ? 1 : 0);
  }

  void updatePresentTime() {
    final newNow = DateTime.now();
  }
}

final chooseTimeProvider =
    NotifierProvider<ChooseTimeNotifier, void>(ChooseTimeNotifier.new);
