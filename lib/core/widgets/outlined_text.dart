import 'package:flutter/material.dart';
import 'package:storeapp/core/theme/app_colors.dart';

/// Text drawn as an outline only. [style] must not have a color.
class OutlinedText extends StatelessWidget {
  const OutlinedText(
    this.text, {
    super.key,
    required this.style,
    this.strokeWidth = 1.2,
    this.color = AppColors.textPrimary,
  });

  final String text;
  final TextStyle style;
  final double strokeWidth;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..color = color,
      ),
    );
  }
}
