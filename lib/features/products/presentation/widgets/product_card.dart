import 'package:flutter/material.dart';
import 'package:storeapp/core/theme/app_colors.dart';
import 'package:storeapp/core/theme/app_text_styles.dart';
import 'package:storeapp/core/utils/format.dart';
import 'package:storeapp/features/products/domain/entities/product.dart';
import 'package:storeapp/features/products/presentation/widgets/product_add_button.dart';
import 'package:storeapp/features/products/presentation/widgets/product_favorite_button.dart';
import 'package:storeapp/features/products/presentation/widgets/product_image_panel.dart';
import 'package:storeapp/features/products/presentation/widgets/product_rating_row.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.isFavorite,
    required this.onTap,
    required this.onFavoriteTap,
    required this.onAddToCart,
  });

  final Product product;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;
  final VoidCallback onAddToCart;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(child: ProductImagePanel(product: product)),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Text(
                    '#${formatProductNumber(product.id)}',
                    style: AppTextStyles.label.copyWith(
                      color: AppColors.ink,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: ProductFavoriteButton(
                    isFavorite: isFavorite,
                    onTap: onFavoriteTap,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: ProductAddButton(onTap: onAddToCart),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product.title.toUpperCase(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.productName,
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Text(formatPrice(product.price), style: AppTextStyles.price),
              const Spacer(),
              ProductRatingRow(
                rating: product.rating,
                iconSize: 13,
                fontSize: 11,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
