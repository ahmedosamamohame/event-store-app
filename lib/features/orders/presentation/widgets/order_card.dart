import 'package:flutter/material.dart';
import 'package:storeapp/core/theme/app_colors.dart';
import 'package:storeapp/core/theme/app_text_styles.dart';
import 'package:storeapp/core/utils/format.dart';
import 'package:storeapp/features/orders/domain/entities/order.dart';
import 'package:storeapp/features/orders/presentation/widgets/order_info_row.dart';
import 'package:storeapp/features/orders/presentation/widgets/order_item_row.dart';
import 'package:storeapp/features/orders/presentation/widgets/order_status_chip.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final customer = order.customer;

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.outline),
      ),
      child: ExpansionTile(
        shape: const Border(),
        collapsedShape: const Border(),
        iconColor: AppColors.accent,
        collapsedIconColor: AppColors.accent,
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        title: Row(
          children: [
            Text(
              'ORDER #${order.id}',
              style: AppTextStyles.sectionTitle.copyWith(fontSize: 16),
            ),
            const SizedBox(width: 8),
            const OrderStatusChip('Placed'),
            const Spacer(),
            Text(
              formatPrice(order.total),
              style: AppTextStyles.price.copyWith(fontWeight: FontWeight.w800),
            ),
          ],
        ),
        subtitle: Text(
          '${formatDate(order.date)}  ·  ${order.itemCount} items',
          style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
        ),
        children: [
          OrderInfoRow(icon: Icons.person_outline, text: customer.name),
          OrderInfoRow(icon: Icons.phone_outlined, text: customer.phone),
          OrderInfoRow(icon: Icons.home_outlined, text: customer.address),
          OrderInfoRow(
            icon: Icons.location_on_outlined,
            text: formatCoordinates(
              customer.location.lat,
              customer.location.lng,
            ),
          ),
          if (customer.notes.isNotEmpty)
            OrderInfoRow(
              icon: Icons.sticky_note_2_outlined,
              text: customer.notes,
            ),
          const OrderInfoRow(
            icon: Icons.payments_outlined,
            text: 'Cash on delivery',
          ),
          const Divider(height: 24),
          for (final item in order.items) OrderItemRow(item: item),
        ],
      ),
    );
  }
}
