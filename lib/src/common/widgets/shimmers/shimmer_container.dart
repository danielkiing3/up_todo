import 'package:flutter/material.dart';
import 'package:up_todo/src/utils/constants/colors.dart';
import 'package:up_todo/src/utils/constants/sizes.dart';

/// Container to model the loading app state with a shimmer
class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    super.key,
    this.isSmall = false,
  });

  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isSmall ? 100 : double.infinity,
      height: isSmall ? 40 : 80,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(USizes.sm),
        color: UColors.white,
      ),
    );
  }
}
