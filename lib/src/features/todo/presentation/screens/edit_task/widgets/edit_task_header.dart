import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:up_todo/src/features/todo/models/todo/task_model.dart';
import 'package:up_todo/src/features/todo/presentation/controllers/edit_task/edit_task_provider.dart';
import 'package:up_todo/src/features/todo/services/todo_service_repository.dart';

class EditTaskHeader extends ConsumerWidget {
  const EditTaskHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(titleEditProvider);
    final description = ref.watch(descriptionEditProvider);
    final checkBoxValue = ref.watch(checkBoxEditProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: [
              // Checkbox
              Checkbox(
                shape: const CircleBorder(
                  side: BorderSide(width: 5),
                ),
                value: checkBoxValue,
                onChanged: (value) {
                  // Update the Todo in the Service
                  ref.read(todoServiceProvider.notifier).updateTask(
                        ref.read(currentEditProvider).complete(value!),
                      );

                  // Update the state of the checkBox provider as well
                  ref.read(checkBoxEditProvider.notifier).state = value;
                },
              ),
              // Title
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    if (description != null &&
                        description.trim().isNotEmpty) ...[
                      const SizedBox(height: 10),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      )
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),

        //Edit button
        IconButton(
          onPressed: () {
            //TODO: Open Edit name and description dialog
          },
          icon: const Icon(IconsaxPlusLinear.edit_2),
        )
      ],
    );
  }
}
