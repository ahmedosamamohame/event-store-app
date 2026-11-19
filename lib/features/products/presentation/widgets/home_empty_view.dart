import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/core/widgets/state_message.dart';
import 'package:storeapp/features/products/presentation/cubit/products_filter_cubit.dart';
import 'package:storeapp/features/products/presentation/cubit/products_filter_state.dart';

/// Shown when the search / filters match no product.
class HomeEmptyView extends StatelessWidget {
  const HomeEmptyView({super.key, required this.filter});

  final ProductsFilterState filter;

  @override
  Widget build(BuildContext context) {
    final onlyFavorites = filter.onlyFavorites && !filter.hasQuery;

    return StateMessage(
      icon: onlyFavorites ? Icons.favorite_border : Icons.search_off,
      title: onlyFavorites ? 'No favorites yet' : 'No products found',
      message: onlyFavorites
          ? 'Tap the heart on any product to save it here.'
          : 'Try a different search or category.',
      actionLabel: onlyFavorites ? null : 'Clear filters',
      onAction: onlyFavorites ? null : context.read<ProductsFilterCubit>().reset,
    );
  }
}
