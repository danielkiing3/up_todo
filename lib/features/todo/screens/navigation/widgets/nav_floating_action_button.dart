import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../utils/constants/colors.dart';

class UNavFloatingActionButton extends StatelessWidget {
  const UNavFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 64,
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: UColors.buttonPrimary,
        elevation: 0,
        shape: const CircleBorder(),
        child: const Icon(
          IconsaxPlusLinear.add,
          color: UColors.white,
          size: 32,
        ),
      ),
    );
  }
}
