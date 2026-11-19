import 'package:flutter/material.dart';
import 'package:storeapp/core/constants/hero_tags.dart';
import 'package:storeapp/core/theme/app_colors.dart';
import 'package:storeapp/core/theme/app_text_styles.dart';
import 'package:storeapp/core/widgets/app_network_image.dart';
import 'package:storeapp/features/products/domain/entities/product.dart';

/// Light panel with the product photo (and an optional big faint number).
/// Shared between the cards and the details screen through a Hero.
class ProductImagePanel extends StatelessWidget {
  const ProductImagePanel({
    super.key,
    required this.product,
    this.imagePadding = 22,
    this.numeral,
    this.numeralSize = 110,
  });

  final Product product;
  final double imagePadding;
  final String? numeral;
  final double numeralSize;

  @override
  Widget build(BuildContext context) {
    final numeral = this.numeral;

    return Hero(
      tag: HeroTags.productImage(product.id),
      child: Material(
        color: AppColors.imagePanel,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (numeral != null)
              Positioned(
                left: 10,
                bottom: -numeralSize * 0.14,
                child: Text(
                  numeral,
                  style: AppTextStyles.display.copyWith(
                    fontSize: numeralSize,
                    letterSpacing: -numeralSize * 0.055,
                    height: 1,
                    color: AppColors.panelNumeral,
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.all(imagePadding),
              child: AppNetworkImage(product.image, iconSize: 44),
            ),
          ],
        ),
      ),
    );
  }
}
