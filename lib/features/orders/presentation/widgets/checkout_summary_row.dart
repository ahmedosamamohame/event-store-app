import 'package:flutter/material.dart';
import 'package:storeapp/core/theme/app_colors.dart';
import 'package:storeapp/core/utils/format.dart';
import 'package:storeapp/features/cart/domain/entities/cart_item.dart';

class CheckoutSummaryRow extends StatelessWidget {
  const CheckoutSummaryRow({super.key, required this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              item.product.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: AppColors.textSecondary),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'x${item.quantity}',
            style: const TextStyle(color: AppColors.textMuted),
          ),
          const SizedBox(width: 12),
          Text(
            formatPrice(item.subtotal),
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
