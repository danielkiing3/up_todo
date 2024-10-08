import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerNotifier extends Notifier<Duration> {
  Timer? _timer;
  final Duration _maxTime = const Duration(minutes: 30);
  bool _isPaused = false;

  @override
  Duration build() {
    return Duration.zero;
  }

  void startTimer() {
    if (_isPaused) {
      // Resume the timer if it was paused
      _isPaused = false;
      _startPeriodicTimer();
    } else {
      // Start the timer from zero if it's a fresh start
      _startPeriodicTimer();
    }
  }

  void _startPeriodicTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state >= _maxTime) {
        timer.cancel();
      } else {
        state = state + const Duration(seconds: 1);
      }
    });
  }

  void pauseTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _isPaused = true; // Set the paused flag
    }
  }

  void stopTimer() {
    _timer?.cancel();
    _isPaused = false; // Ensure pause is reset on stop
  }

  void resetTimer() {
    stopTimer();
    state = Duration.zero; // Reset the timer's state to zero
  }

  bool isPaused() => _isPaused;
}

final timerProvider =
    NotifierProvider<TimerNotifier, Duration>(TimerNotifier.new);
