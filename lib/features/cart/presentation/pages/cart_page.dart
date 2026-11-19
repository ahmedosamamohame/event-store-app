import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/core/widgets/content_width.dart';
import 'package:storeapp/core/widgets/section_heading.dart';
import 'package:storeapp/core/widgets/state_message.dart';
import 'package:storeapp/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:storeapp/features/cart/presentation/cubit/cart_state.dart';
import 'package:storeapp/features/cart/presentation/widgets/cart_summary.dart';
import 'package:storeapp/features/cart/presentation/widgets/cart_tile.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MY CART')),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.isEmpty) {
            return StateMessage(
              icon: Icons.shopping_bag_outlined,
              title: 'Your cart is empty',
              message: 'Add something you like and it will show up here.',
              actionLabel: 'Browse products',
              onAction: () => Navigator.pop(context),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ContentWidth(
                  child: ListView.separated(
                    padding: const EdgeInsets.only(bottom: 16),
                    itemCount: state.items.length + 1,
                    separatorBuilder: (context, index) => index == 0
                        ? const SizedBox.shrink()
                        : const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Divider(height: 1),
                          ),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return SectionHeading(
                          title: 'Your bag',
                          count: state.itemCount,
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CartTile(item: state.items[index - 1]),
                      );
                    },
                  ),
                ),
              ),
              CartSummary(total: state.total),
            ],
          );
        },
      ),
    );
  }
}
