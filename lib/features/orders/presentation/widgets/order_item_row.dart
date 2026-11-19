import 'package:flutter/material.dart';
import 'package:storeapp/core/theme/app_colors.dart';
import 'package:storeapp/core/widgets/app_network_image.dart';
import 'package:storeapp/features/cart/domain/entities/cart_item.dart';

class OrderItemRow extends StatelessWidget {
  const OrderItemRow({super.key, required this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            height: 52,
            width: 44,
            padding: const EdgeInsets.all(4),
            color: AppColors.imagePanel,
            child: AppNetworkImage(item.product.image, iconSize: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              item.product.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'x${item.quantity}',
            style: const TextStyle(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
