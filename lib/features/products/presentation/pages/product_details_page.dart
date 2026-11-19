import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/core/theme/app_colors.dart';
import 'package:storeapp/core/theme/app_text_styles.dart';
import 'package:storeapp/core/utils/format.dart';
import 'package:storeapp/core/widgets/bottom_action_bar.dart';
import 'package:storeapp/core/widgets/content_width.dart';
import 'package:storeapp/core/widgets/fade_slide_in.dart';
import 'package:storeapp/core/widgets/primary_button.dart';
import 'package:storeapp/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:storeapp/features/cart/presentation/widgets/show_added_to_cart.dart';
import 'package:storeapp/features/products/domain/entities/product.dart';
import 'package:storeapp/features/products/presentation/widgets/product_category_badge.dart';
import 'package:storeapp/features/products/presentation/widgets/product_details_favorite_action.dart';
import 'package:storeapp/features/products/presentation/widgets/product_image_panel.dart';
import 'package:storeapp/features/products/presentation/widgets/product_rating_row.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        shape: const Border(),
        iconTheme: const IconThemeData(color: AppColors.ink),
        actions: [
          ProductDetailsFavoriteAction(productId: product.id),
          const SizedBox(width: 8),
        ],
      ),
      body: ContentWidth(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 400,
                width: double.infinity,
                child: ProductImagePanel(
                  product: product,
                  imagePadding: 64,
                  numeral: formatProductNumber(product.id),
                  numeralSize: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                child: FadeSlideIn(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(child: ProductCategoryBadge(product.category)),
                          const Spacer(),
                          if (product.rating != null)
                            ProductRatingRow(
                              rating: product.rating,
                              iconSize: 18,
                              fontSize: 13,
                            ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Text(
                        product.title.toUpperCase(),
                        style: AppTextStyles.sectionTitle.copyWith(
                          fontSize: 26,
                          height: 1.05,
                          letterSpacing: -0.8,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        formatPrice(product.price),
                        style: AppTextStyles.price.copyWith(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -1,
                        ),
                      ),
                      const SizedBox(height: 22),
                      const Divider(height: 1),
                      const SizedBox(height: 18),
                      Text('DESCRIPTION', style: AppTextStyles.label),
                      const SizedBox(height: 10),
                      Text(
                        product.description,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          height: 1.7,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomActionBar(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
        decoration: const BoxDecoration(
          color: AppColors.background,
          border: Border(top: BorderSide(color: AppColors.outline)),
        ),
        child: PrimaryButton(
          text: 'Add to cart',
          icon: Icons.add_shopping_cart,
          onPressed: () {
            context.read<CartCubit>().add(product);
            showAddedToCart(context);
          },
        ),
      ),
    );
  }
}
