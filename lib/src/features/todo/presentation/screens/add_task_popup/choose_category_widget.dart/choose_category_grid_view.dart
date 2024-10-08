import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../repositories/category_repository.dart';
import 'choose_category_tag.dart';

/// Custom widget for the Gridview of the Choose Categoy Widget
class ChooseCategoryGridView extends ConsumerWidget {
  /// Custom widget for the Gridview of the Choose Categoy Widget
  ///
  /// Build with a scrollable Gridview
  /// Contains [Category] loaded from a repositories and a button to add new Cateogry
  const ChooseCategoryGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesRepository);

    return categories.when(
      data: (value) {
        return ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 470),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 20, mainAxisSpacing: 10),
            itemCount: value.length,
            itemBuilder: (_, index) {
              final category = value[index];
              return ChooseCategoryTag(category);
            },
          ),
        );
      },
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }
}
