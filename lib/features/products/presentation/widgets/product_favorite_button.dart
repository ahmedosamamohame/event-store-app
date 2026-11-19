import 'package:flutter/material.dart';
import 'package:storeapp/core/theme/app_colors.dart';

/// Heart on top of the product photo; bounces when it becomes a favorite.
class ProductFavoriteButton extends StatelessWidget {
  const ProductFavoriteButton({
    super.key,
    required this.isFavorite,
    required this.onTap,
  });

  final bool isFavorite;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: TweenAnimationBuilder<double>(
            key: ValueKey<bool>(isFavorite),
            tween: Tween(begin: isFavorite ? 1.6 : 1.0, end: 1.0),
            duration: const Duration(milliseconds: 450),
            curve: Curves.elasticOut,
            builder: (context, scale, child) =>
                Transform.scale(scale: scale, child: child),
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              size: 20,
              color: isFavorite ? AppColors.danger : AppColors.ink,
            ),
          ),
        ),
      ),
    );
  }
}
