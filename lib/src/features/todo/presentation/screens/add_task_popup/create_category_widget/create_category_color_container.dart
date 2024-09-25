import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../controllers/create_category/create_category_provider.dart';

class CategoryColorContainer extends ConsumerWidget {
  const CategoryColorContainer({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelectedColor = ref.watch(selecteCategoryColorProvider) == color;

    return Padding(
      padding: const EdgeInsets.only(left: USizes.buttonHeight),
      child: GestureDetector(
        onTap: () =>
            ref.read(selecteCategoryColorProvider.notifier).state = color,
        child: Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(150),
          ),
          child: isSelectedColor ? const Icon(Icons.check) : null,
        ),
      ),
    );
  }
}
