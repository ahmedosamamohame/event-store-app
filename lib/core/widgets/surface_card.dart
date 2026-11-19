import 'package:flutter/material.dart';
import 'package:storeapp/core/theme/app_colors.dart';

/// Flat square box with a hairline border.
class SurfaceCard extends StatelessWidget {
  const SurfaceCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.clip = Clip.none,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Clip clip;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: clip,
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.outline),
      ),
      child: child,
    );
  }
}
