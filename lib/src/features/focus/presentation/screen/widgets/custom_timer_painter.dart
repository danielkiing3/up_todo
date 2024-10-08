import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:up_todo/src/utils/constants/colors.dart';

/// Custom Painter for the Timer Module
class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    required this.progress,
  });

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    // Paint for circular background
    Paint backgroundPaint = Paint()
      ..color = UColors.grey
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke;

    // Paint for progress
    Paint progressPaint = Paint()
      ..color = UColors.buttonPrimary
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    /// Take the mininum of the [size] width or heigh and a [5] offset
    double radius = min(size.width / 2, size.height / 2) - 5;

    // Center offset
    Offset center = size.center(Offset.zero);

    // Draw background
    canvas.drawCircle(center, radius, backgroundPaint);

    // Progress value based on the pi value
    double progressArc = 2 * pi * progress;

    // Draw the progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2, // (3 * pi / 2)
      progressArc,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
