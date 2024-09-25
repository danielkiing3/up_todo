import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:up_todo/src/common/widgets/appbar/app_bar.dart';
import 'package:up_todo/src/features/todo/presentation/controllers/create_category/create_category_provider.dart';
import 'package:up_todo/src/features/todo/presentation/screens/add_task_popup/create_category_widget/create_category_action_button.dart';
import 'package:up_todo/src/utils/constants/sizes.dart';
import 'package:up_todo/src/utils/constants/texts.dart';

import '../../../../../../utils/constants/colors.dart';
import 'crate_category_icon_library.dart';
import 'create_category_color_container.dart';

class CreateCategoryPage extends StatelessWidget {
  const CreateCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UAppBar(
        title: Text(UTexts.createNewCategory),
        showBackArrow: false,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: USizes.buttonHeight,
                left: USizes.buttonHeight,
                right: USizes.buttonHeight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // -- Category name
                  Text('${UTexts.categoryName}:'),
                  SizedBox(height: USizes.sm),

                  CreateCategoryForm(),
                  SizedBox(height: USizes.md),

                  // - Category Icon
                  Text(UTexts.categoryIcon),
                  SizedBox(height: USizes.md),

                  CategoryIconLibrary(),
                  SizedBox(height: USizes.md),

                  // -- Category Color
                  Text(UTexts.categoryColor),
                  SizedBox(height: USizes.md),
                ],
              ),
            ),
            SizedBox(
              height: 44,
              child: ListView.builder(
                itemCount: UCreateCategoryColors.colors.length,
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return CategoryColorContainer(
                    color: UCreateCategoryColors.colors[index],
                  );
                },
              ),
            ),
            const Spacer(),

            // -- Action Button
            const CreateCategoryActionButton(),
            const SizedBox(height: USizes.defaultSpace),
          ],
        ),
      ),
    );
  }
}

class CreateCategoryForm extends ConsumerWidget {
  const CreateCategoryForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: ref.read(createNewCategoryProvider.notifier).categoryForm,
      child: TextFormField(
        controller: ref.read(createNewCategoryProvider.notifier).name,
        // validator: ,
        decoration: const InputDecoration(hintText: UTexts.categoryName),
      ),
    );
  }
}
