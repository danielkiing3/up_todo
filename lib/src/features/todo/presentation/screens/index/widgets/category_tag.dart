import 'package:flutter/material.dart';

import '../../../../models/category/category_model.dart';

class CategoryTag extends StatelessWidget {
  const CategoryTag(this.category, {super.key});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: category.backgroundColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        children: [
          Icon(
            category.icon,
            color: category.iconColor,
            size: 14,
          ),
          const SizedBox(width: 10),
          Text(category.name)
        ],
      ),
    );
  }
}
