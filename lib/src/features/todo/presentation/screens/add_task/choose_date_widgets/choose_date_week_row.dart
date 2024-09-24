import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';

class ChooseDateWeekRow extends StatelessWidget {
  const ChooseDateWeekRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: mainWeek.map((currentDay) {
        // Checks if the current day is SUN or SAT
        bool isWeekend = currentDay == 'SUN' || currentDay == 'SAT';

        return Text(
          currentDay,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: isWeekend ? UColors.error : null),
        );
      }).toList(),
    );
  }
}

final mainWeek = ['SUN', 'MON', 'TUE', 'WED', "THU", "FRI", "SAT"];
final secondWeek = ['MON', 'TUE', 'WED', "THU", "FRI", "SAT", 'SUN'];
