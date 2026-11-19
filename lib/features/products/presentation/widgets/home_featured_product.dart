import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/core/constants/app_routes.dart';
import 'package:storeapp/core/theme/app_colors.dart';
import 'package:storeapp/core/theme/app_text_styles.dart';
import 'package:storeapp/core/utils/format.dart';
import 'package:storeapp/core/utils/text_utils.dart';
import 'package:storeapp/core/widgets/fade_slide_in.dart';
import 'package:storeapp/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:storeapp/features/cart/presentation/widgets/show_added_to_cart.dart';
import 'package:storeapp/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:storeapp/features/products/domain/entities/product.dart';
import 'package:storeapp/features/products/presentation/widgets/product_add_button.dart';
import 'package:storeapp/features/products/presentation/widgets/product_favorite_button.dart';
import 'package:storeapp/features/products/presentation/widgets/product_image_panel.dart';

/// Big full-width card for the best product of the current list.
class HomeFeaturedProduct extends StatelessWidget {
  const HomeFeaturedProduct({
    super.key,
    required this.product,
    required this.isFavorite,
  });

  final Product product;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final number = formatProductNumber(product.id);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: FadeSlideIn(
        child: InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            AppRoutes.product,
            arguments: product,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 240,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ProductImagePanel(
                        product: product,
                        imagePadding: 34,
                        numeral: number,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 3,
                        ),
                        color: AppColors.danger,
                        child: Text(
                          product.rating != null ? 'TOP RATED' : '#$number',
                          style: AppTextStyles.label.copyWith(
                            color: AppColors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: ProductFavoriteButton(
                        isFavorite: isFavorite,
                        onTap: () =>
                            context.read<FavoritesCubit>().toggle(product.id),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          capitalizeWords(product.category).toUpperCase(),
                          style: AppTextStyles.label,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          product.title.toUpperCase(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.productName.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          formatPrice(product.price),
                          style: AppTextStyles.price.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  ProductAddButton(
                    filled: true,
                    onTap: () {
                      context.read<CartCubit>().add(product);
                      showAddedToCart(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
