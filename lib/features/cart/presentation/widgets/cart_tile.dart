import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/core/theme/app_colors.dart';
import 'package:storeapp/core/theme/app_text_styles.dart';
import 'package:storeapp/core/utils/format.dart';
import 'package:storeapp/core/widgets/app_network_image.dart';
import 'package:storeapp/features/cart/domain/entities/cart_item.dart';
import 'package:storeapp/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:storeapp/features/cart/presentation/widgets/quantity_button.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key, required this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    final cart = context.read<CartCubit>();
    final product = item.product;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 112,
            width: 96,
            padding: const EdgeInsets.all(10),
            color: AppColors.imagePanel,
            child: AppNetworkImage(product.image),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: SizedBox(
              height: 112,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title.toUpperCase(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.productName,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    formatPrice(product.price),
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textMuted,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      QuantityButton(
                        icon: Icons.remove,
                        onTap: () => cart.decrement(product.id),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Text(
                          '${item.quantity}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      QuantityButton(
                        icon: Icons.add,
                        onTap: () => cart.increment(product.id),
                      ),
                      const Spacer(),
                      Text(
                        formatPrice(item.subtotal),
                        style: AppTextStyles.price.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            tooltip: 'Remove',
            visualDensity: VisualDensity.compact,
            onPressed: () => cart.remove(product.id),
            icon: const Icon(Icons.delete_outline, color: AppColors.danger),
          ),
        ],
      ),
    );
  }
}
