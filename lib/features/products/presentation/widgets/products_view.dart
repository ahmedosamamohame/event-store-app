import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/core/utils/text_utils.dart';
import 'package:storeapp/core/widgets/content_width.dart';
import 'package:storeapp/core/widgets/section_heading.dart';
import 'package:storeapp/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:storeapp/features/products/domain/entities/product.dart';
import 'package:storeapp/features/products/presentation/cubit/products_filter_cubit.dart';
import 'package:storeapp/features/products/presentation/cubit/products_filter_state.dart';
import 'package:storeapp/features/products/presentation/widgets/home_empty_view.dart';
import 'package:storeapp/features/products/presentation/widgets/home_featured_product.dart';
import 'package:storeapp/features/products/presentation/widgets/home_filter_chips.dart';
import 'package:storeapp/features/products/presentation/widgets/home_search_field.dart';
import 'package:storeapp/features/products/presentation/widgets/products_grid.dart';

/// The loaded home screen: search, tabs, big heading, featured product and
/// the staggered grid, all in one scroll view.
class ProductsView extends StatelessWidget {
  const ProductsView({
    super.key,
    required this.products,
    this.isRefreshing = false,
  });

  final List<Product> products;
  final bool isRefreshing;

  String _title(ProductsFilterState filter) {
    if (filter.onlyFavorites) return 'Favorites';
    final category = filter.category;
    if (category != null) return capitalizeWords(category);
    return 'All products';
  }

  /// Highest rated product, or the first one when nothing has a rating.
  Product _featured(List<Product> visible) {
    var best = visible.first;
    for (final product in visible) {
      final rate = product.rating?.rate ?? -1;
      final bestRate = best.rating?.rate ?? -1;
      if (rate > bestRate) best = product;
    }
    return best;
  }

  @override
  Widget build(BuildContext context) {
    final categories = products.map((p) => p.category).toSet().toList()..sort();

    return BlocBuilder<FavoritesCubit, Set<int>>(
      builder: (context, favorites) {
        return BlocBuilder<ProductsFilterCubit, ProductsFilterState>(
          builder: (context, filter) {
            final visible = filter.apply(products, favorites);
            final featured = visible.isEmpty ? null : _featured(visible);
            final rest = featured == null
                ? visible
                : visible.where((p) => p.id != featured.id).toList();

            return ContentWidth(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 2,
                      child: isRefreshing ? const LinearProgressIndicator() : null,
                    ),
                  ),
                  const SliverToBoxAdapter(child: HomeSearchField()),
                  SliverToBoxAdapter(
                    child: HomeFilterChips(
                      categories: categories,
                      filter: filter,
                      favoritesCount: favorites.length,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SectionHeading(
                      title: _title(filter),
                      count: visible.length,
                    ),
                  ),
                  if (featured == null)
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: HomeEmptyView(filter: filter),
                    )
                  else ...[
                    SliverToBoxAdapter(
                      child: HomeFeaturedProduct(
                        product: featured,
                        isFavorite: favorites.contains(featured.id),
                      ),
                    ),
                    ProductsGrid(products: rest, favorites: favorites),
                  ],
                ],
              ),
            );
          },
        );
      },
    );
  }
}
