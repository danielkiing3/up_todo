import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../utils/constants/texts.dart';
import '../../../../../../utils/validators/validation.dart';
import '../../../controllers/add_task/add_task_provider.dart';
import 'add_task_action_buttons.dart';
import 'add_task_tag_row.dart';

class AddTaskMainBody extends ConsumerWidget {
  const AddTaskMainBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(
        top: 30,
        left: 25,
        right: 25,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            UTexts.addTask,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),

          // -- Title
          Form(
            key: ref.read(addTaskProvider.notifier).formKey,
            child: TextFormField(
              autofocus: true,
              maxLines: 1,
              maxLength: 50,
              controller: ref.read(addTaskProvider.notifier).title,
              validator: (value) =>
                  UValidator.validateEmptyText('Title', value),
              decoration: const InputDecoration(
                hintText: UTexts.exampleTitle,
                fillColor: Colors.transparent,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 10),

          // -- Description
          TextField(
            minLines: 1,
            maxLines: 2,
            controller: ref.read(addTaskProvider.notifier).description,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              hintText: UTexts.description,
              fillColor: Colors.transparent,
              enabledBorder: InputBorder.none,
            ),
          ),
          const SizedBox(height: 10),

          // -- Tag Row
          const AddTaskTagRow(),

          // -- Action Button
          const AddTaskActionButtons()
        ],
      ),
    );
  }
}
