import 'package:flutter/widgets.dart';
import 'package:up_todo/src/utils/constants/colors.dart';

class UVerticalDivider extends StatelessWidget {
  const UVerticalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 1.0,
      color: UColors.borderPrimary,
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
    );
  }
}
