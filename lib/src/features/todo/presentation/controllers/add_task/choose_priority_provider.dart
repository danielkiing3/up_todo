import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'task_tag_provider.dart';

class ChoosePriorityNotifier extends Notifier<int> {
  @override
  int build() {
    return 1;
  }

  void update(int value) {
    state = value;
  }

  void cancel(BuildContext context) {
    state = 1;
    Navigator.of(context).pop();
  }

  // Function to reset the value of the task priority to 1
  void reset() {
    state = 1;
  }

  void save(BuildContext context) {
    ref.read(taskTagProvider.notifier).updatePriority(state);
    context.pop();
  }
}

final choosePriorityProvider =
    NotifierProvider<ChoosePriorityNotifier, int>(ChoosePriorityNotifier.new);
