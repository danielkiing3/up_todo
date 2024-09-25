import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/src/utils/constants/colors.dart';
import 'package:up_todo/src/utils/constants/routes.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/category/category_model.dart';
import '../../../controllers/add_task_popup/choose_category_provider.dart';

class ChooseCategoryTag extends ConsumerWidget {
  /// Custom widget to build the individual Category Container
  ///
  /// Required:
  ///   - [category] - Used to build the Category Widget
  const ChooseCategoryTag(
    this.category, {
    super.key,
  });

  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(chooseCategoryProvider) == category;

    return GestureDetector(
      onTap: () {
        if (category.isCreateNewButton == false) {
          ref.read(chooseCategoryProvider.notifier).update(category);
        } else {
          // TaskBottomSheet.showCreateNewDialog(context);
          context.pushNamed(URoutes.createCategoryScreen);
        }
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(USizes.md),
            decoration: BoxDecoration(
                color: category.backgroundColor,
                borderRadius: BorderRadius.circular(USizes.xs)),
            child: Icon(
              category.icon,
              color: category.iconColor,
              size: USizes.iconLg,
            ),
          ),
          const SizedBox(height: USizes.sm),
          Text(
            category.name,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: isSelected ? UColors.primary : null),
          )
        ],
      ),
    );
  }
}
