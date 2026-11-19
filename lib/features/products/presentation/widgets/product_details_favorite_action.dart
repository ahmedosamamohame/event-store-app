import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/core/theme/app_colors.dart';
import 'package:storeapp/features/favorites/presentation/cubit/favorites_cubit.dart';

/// Heart icon for the details page app bar.
class ProductDetailsFavoriteAction extends StatelessWidget {
  const ProductDetailsFavoriteAction({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, Set<int>>(
      builder: (context, favorites) {
        final isFavorite = favorites.contains(productId);
        return IconButton(
          tooltip: 'Favorite',
          onPressed: () => context.read<FavoritesCubit>().toggle(productId),
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? AppColors.danger : AppColors.ink,
          ),
        );
      },
    );
  }
}
