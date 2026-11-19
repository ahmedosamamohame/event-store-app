import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/core/theme/app_colors.dart';
import 'package:storeapp/core/utils/text_utils.dart';
import 'package:storeapp/features/products/presentation/cubit/products_filter_cubit.dart';
import 'package:storeapp/features/products/presentation/cubit/products_filter_state.dart';
import 'package:storeapp/features/products/presentation/widgets/home_filter_chip.dart';

/// "All", "Favorites (n)" and one tab per category.
class HomeFilterChips extends StatelessWidget {
  const HomeFilterChips({
    super.key,
    required this.categories,
    required this.filter,
    required this.favoritesCount,
  });

  final List<String> categories;
  final ProductsFilterState filter;
  final int favoritesCount;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductsFilterCubit>();

    return Container(
      height: 46,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.outline)),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(16, 14, 0, 0),
        children: [
          HomeFilterChip(
            label: 'All',
            selected: filter.isAllSelected,
            onTap: cubit.showAll,
          ),
          HomeFilterChip(
            label: 'Favorites ($favoritesCount)',
            selected: filter.onlyFavorites,
            onTap: cubit.showFavorites,
          ),
          for (final category in categories)
            HomeFilterChip(
              label: capitalizeWords(category),
              selected: filter.category == category,
              onTap: () => cubit.selectCategory(category),
            ),
        ],
      ),
    );
  }
}
