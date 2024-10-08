import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:up_todo/src/features/focus/presentation/controller/timer_provider.dart';
import 'package:up_todo/src/features/focus/presentation/screen/widgets/custom_timer_painter.dart';

class FoucsTimer extends ConsumerWidget {
  const FoucsTimer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerProvider);

    return Center(
      child: CustomPaint(
        painter: CustomTimerPainter(
          progress:
              timerState.inSeconds / const Duration(minutes: 30).inSeconds,
        ),
        child: SizedBox(
          width: 215,
          height: 215,
          child: Center(
            child: Text(
              getTimeString(timerState),
              style: const TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  String getTimeString(Duration time) {
    String minutes = time.inMinutes.toString().padLeft(2, '0');
    String seconds = (time.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
