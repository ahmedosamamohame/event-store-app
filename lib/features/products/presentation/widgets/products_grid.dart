import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/core/constants/app_routes.dart';
import 'package:storeapp/core/widgets/fade_slide_in.dart';
import 'package:storeapp/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:storeapp/features/cart/presentation/widgets/show_added_to_cart.dart';
import 'package:storeapp/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:storeapp/features/products/domain/entities/product.dart';
import 'package:storeapp/features/products/presentation/widgets/product_card.dart';

/// Two-column staggered grid (the right column sits lower). It is a sliver,
/// so it scrolls together with the rest of the home screen.
class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    super.key,
    required this.products,
    required this.favorites,
  });

  final List<Product> products;
  final Set<int> favorites;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 26, 16, 32),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 330,
          crossAxisSpacing: 12,
          mainAxisSpacing: 18,
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: products.length,
          (context, index) {
            final product = products[index];
            return Padding(
              padding: EdgeInsets.only(top: index.isOdd ? 28 : 0),
              child: FadeSlideIn(
                delay: Duration(milliseconds: (index % 6) * 70),
                child: ProductCard(
                  product: product,
                  isFavorite: favorites.contains(product.id),
                  onTap: () => Navigator.pushNamed(
                    context,
                    AppRoutes.product,
                    arguments: product,
                  ),
                  onFavoriteTap: () =>
                      context.read<FavoritesCubit>().toggle(product.id),
                  onAddToCart: () {
                    context.read<CartCubit>().add(product);
                    showAddedToCart(context);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
