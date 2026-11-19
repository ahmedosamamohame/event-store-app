import 'package:flutter/material.dart';
import 'package:storeapp/core/theme/app_colors.dart';

/// Pulsing placeholder block shown while content loads.
class ShimmerBox extends StatefulWidget {
  const ShimmerBox({super.key, this.width, this.height});

  final double? width;
  final double? height;

  @override
  State<ShimmerBox> createState() => _ShimmerBoxState();
}

class _ShimmerBoxState extends State<ShimmerBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    )..repeat(reverse: true);
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
      builder: (context, _) {
        final t = Curves.easeInOut.transform(_controller.value);
        return Container(
          width: widget.width,
          height: widget.height,
          color: Color.lerp(AppColors.surface, AppColors.surfaceHigh, t),
        );
      },
    );
  }
}
