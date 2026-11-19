import 'package:flutter/material.dart';
import 'package:storeapp/core/theme/app_colors.dart';
import 'package:storeapp/features/products/domain/entities/rating.dart';

/// Star + "4.5 (120)". Shows a "New" label when the product has no rating yet.
class ProductRatingRow extends StatelessWidget {
  const ProductRatingRow({
    super.key,
    required this.rating,
    this.iconSize = 16,
    this.fontSize = 12,
  });

  final Rating? rating;
  final double iconSize;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final value = rating;

    if (value == null) {
      return Text(
        'NEW',
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star_rounded, size: iconSize, color: AppColors.accent),
        const SizedBox(width: 4),
        Text(
          '${value.rate} (${value.count})',
          style: TextStyle(fontSize: fontSize, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
