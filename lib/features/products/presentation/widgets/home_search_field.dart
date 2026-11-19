import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/core/widgets/app_input_decoration.dart';
import 'package:storeapp/features/products/presentation/cubit/products_filter_cubit.dart';
import 'package:storeapp/features/products/presentation/cubit/products_filter_state.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final filter = context.read<ProductsFilterCubit>();

    return BlocBuilder<ProductsFilterCubit, ProductsFilterState>(
      buildWhen: (previous, current) =>
          previous.hasQuery != current.hasQuery ||
          previous.searchResetCount != current.searchResetCount,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
          child: TextField(
            // A new key recreates the field, which empties it.
            key: ValueKey<int>(state.searchResetCount),
            onChanged: filter.queryChanged,
            textInputAction: TextInputAction.search,
            decoration: appInputDecoration(
              'Search products',
              icon: Icons.search,
            ).copyWith(
              suffixIcon: state.hasQuery
                  ? IconButton(
                      tooltip: 'Clear',
                      icon: const Icon(Icons.close),
                      onPressed: filter.queryCleared,
                    )
                  : null,
            ),
          ),
        );
      },
    );
  }
}
