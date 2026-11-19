import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/core/theme/app_text_styles.dart';
import 'package:storeapp/core/utils/format.dart';
import 'package:storeapp/core/widgets/surface_card.dart';
import 'package:storeapp/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:storeapp/features/cart/presentation/cubit/cart_state.dart';
import 'package:storeapp/features/orders/presentation/widgets/checkout_section_title.dart';
import 'package:storeapp/features/orders/presentation/widgets/checkout_summary_row.dart';

class CheckoutSummarySection extends StatelessWidget {
  const CheckoutSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CheckoutSectionTitle('Order summary', number: '04'),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return SurfaceCard(
              child: Column(
                children: [
                  for (final item in state.items)
                    CheckoutSummaryRow(item: item),
                  const Divider(height: 20),
                  Row(
                    children: [
                      Text('TOTAL', style: AppTextStyles.label),
                      const Spacer(),
                      Text(
                        formatPrice(state.total),
                        style: AppTextStyles.sectionTitle.copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
