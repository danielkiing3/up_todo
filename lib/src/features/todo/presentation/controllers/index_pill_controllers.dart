import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifier for toggling 'Today' list visibility
class TodayListVisibilityNotifier extends StateNotifier<bool> {
  TodayListVisibilityNotifier() : super(true);

  void toggle() => state = !state;
}

// StateNotifier for toggling 'Completed' list visibility
class CompletedListVisibilityNotifier extends StateNotifier<bool> {
  CompletedListVisibilityNotifier() : super(true);

  void toggle() => state = !state;
}

// Providers for the state notifiers
final todayListVisibilityProvider =
    StateNotifierProvider<TodayListVisibilityNotifier, bool>(
  (ref) => TodayListVisibilityNotifier(),
);

final completedListVisibilityProvider =
    StateNotifierProvider<CompletedListVisibilityNotifier, bool>(
  (ref) => CompletedListVisibilityNotifier(),
);
