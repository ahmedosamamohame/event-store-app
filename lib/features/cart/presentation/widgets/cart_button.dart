import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/core/constants/app_routes.dart';
import 'package:storeapp/core/theme/app_colors.dart';
import 'package:storeapp/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:storeapp/features/cart/presentation/cubit/cart_state.dart';

/// Bag icon with an item counter that pops whenever the count changes.
class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) => previous.itemCount != current.itemCount,
      builder: (context, state) {
        final count = state.itemCount;
        return IconButton(
          tooltip: 'Cart',
          onPressed: () => Navigator.pushNamed(context, AppRoutes.cart),
          icon: TweenAnimationBuilder<double>(
            key: ValueKey<int>(count),
            tween: Tween(begin: 1.35, end: 1.0),
            duration: const Duration(milliseconds: 450),
            curve: Curves.elasticOut,
            builder: (context, scale, child) =>
                Transform.scale(scale: scale, child: child),
            child: Badge.count(
              count: count,
              backgroundColor: AppColors.cream,
              textColor: AppColors.ink,
              child: const Icon(Icons.shopping_bag_outlined),
            ),
          ),
        );
      },
    );
  }
}
