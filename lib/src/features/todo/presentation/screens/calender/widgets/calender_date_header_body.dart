import 'package:flutter/widgets.dart';
import 'package:up_todo/src/features/todo/presentation/screens/calender/widgets/calender_date_container.dart';
import 'package:up_todo/src/features/todo/presentation/screens/calender/widgets/calender_date_picker_header.dart';
import 'package:up_todo/src/utils/constants/colors.dart';

class CalenderDateHeaderBody extends StatelessWidget
    implements PreferredSizeWidget {
  const CalenderDateHeaderBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: UColors.bottomSheetPrimary,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CalenderDatePickerHeader(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int i = 0; i < 7; i++) CalenderDateContainer(i),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(140);
}
