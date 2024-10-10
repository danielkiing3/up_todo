import 'package:flutter/material.dart';
import 'package:up_todo/src/utils/constants/colors.dart';

/// Animated shimmer archieve using ShaderMask, AnimationController using a
///   SingleTickerProviderStateMixin and linear gradient
class AnimatedShimmer extends StatefulWidget {
  const AnimatedShimmer({super.key, required this.child});

  /// Widget to apply the shimmer effect on
  final Widget child;

  @override
  State<AnimatedShimmer> createState() => _AnimatedShimmerState();
}

class _AnimatedShimmerState extends State<AnimatedShimmer>
    with SingleTickerProviderStateMixin {
  /// Animation controller for the shimmer
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return _shimmerGradient.createShader(Rect.fromLTWH(
              -bounds.width + (bounds.width * 2) * _controller.value,
              0,
              bounds.width,
              bounds.height,
            ));
          },
          child: widget.child,
        );
      },
      child: widget.child,
    );
  }
}

/// Gradient for the shimmer effect
const _shimmerGradient = LinearGradient(
  colors: [
    UColors.bottomSheetPrimary,
    Color(0xFFF4F4F4),
    UColors.bottomSheetPrimary,
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);
