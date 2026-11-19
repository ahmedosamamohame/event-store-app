import 'package:flutter/material.dart';
import 'package:storeapp/core/theme/app_colors.dart';

/// Small black square tag.
class OrderStatusChip extends StatelessWidget {
  const OrderStatusChip(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      color: AppColors.accent,
      child: Text(
        label.toUpperCase(),
        style: const TextStyle(
          fontSize: 10,
          letterSpacing: 0.8,
          fontWeight: FontWeight.w800,
          color: AppColors.onAccent,
        ),
      ),
    );
  }
}
