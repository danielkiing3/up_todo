import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/texts.dart';

class CategoryIconLibrary extends ConsumerWidget {
  const CategoryIconLibrary({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: UColors.white.withOpacity(0.21),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Text(
          UTexts.chooseIconLibrary,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}

//TODO: Get icon popup