import 'package:flutter/material.dart';
import 'package:storeapp/core/theme/app_colors.dart';

/// "+" button that adds to cart. Plain icon on the photo, or a solid cream
/// square ([filled]).
class ProductAddButton extends StatelessWidget {
  const ProductAddButton({super.key, required this.onTap, this.filled = false});

  final VoidCallback onTap;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    if (filled) {
      return Material(
        color: AppColors.cream,
        child: InkWell(
          onTap: onTap,
          child: const SizedBox(
            height: 46,
            width: 46,
            child: Icon(Icons.add, size: 22, color: AppColors.ink),
          ),
        ),
      );
    }
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onTap,
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.add, size: 22, color: AppColors.ink),
        ),
      ),
    );
  }
}
