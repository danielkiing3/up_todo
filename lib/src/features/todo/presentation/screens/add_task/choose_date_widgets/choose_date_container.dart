import 'package:flutter/material.dart';


import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';

import 'choose_date_action_buttons.dart';
import 'choose_date_grid_view.dart';
import 'choose_date_header.dart';
import 'choose_date_week_row.dart';

class ChooseDateContainer extends StatelessWidget {
  const ChooseDateContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(USizes.md),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(USizes.sm),
          color: UColors.bottomSheetPrimary,
        ),
        padding: const EdgeInsets.all(USizes.md),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              // -- Header
              ChooseDateHeader(),
              SizedBox(height: USizes.sm),

              // -- Divider
              Divider(color: UColors.borderPrimary, height: 10),
              SizedBox(height: USizes.md),

              // -- Days of the week
              ChooseDateWeekRow(),
              SizedBox(height: USizes.md),

              // -- Main Content
              ChooseDateGridView(),
              SizedBox(height: USizes.md),

              // -- Action Buttons
              ChooseDateActionButtons()
            ],
          ),
        ),
      ),
    );
  }
}
