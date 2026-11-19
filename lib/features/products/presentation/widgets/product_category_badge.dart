import 'package:flutter/material.dart';
import 'package:storeapp/core/theme/app_colors.dart';
import 'package:storeapp/core/theme/app_text_styles.dart';

/// Outlined tag with the category name.
class ProductCategoryBadge extends StatelessWidget {
  const ProductCategoryBadge(this.category, {super.key});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textPrimary),
      ),
      child: Text(
        category.toUpperCase(),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.label.copyWith(
          color: AppColors.textPrimary,
          fontSize: 10,
        ),
      ),
    );
  }
}
