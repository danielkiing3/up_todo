import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'task_tag_provider.dart';

class DateNotifier extends Notifier<DateTime?> {
  @override
  DateTime? build() {
    return null;
  }

  void update(DateTime value) {
    state = value;
    ref.read(taskTagProvider.notifier).updateDate(state!);
  }
}

final dateProvider =
    NotifierProvider<DateNotifier, DateTime?>(DateNotifier.new);
