import 'package:flutter/material.dart';
import 'package:storeapp/core/theme/app_colors.dart';
import 'package:storeapp/core/widgets/surface_card.dart';
import 'package:storeapp/features/orders/presentation/widgets/checkout_section_title.dart';

class CheckoutPaymentSection extends StatelessWidget {
  const CheckoutPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckoutSectionTitle('Payment', number: '03'),
        SurfaceCard(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Icon(Icons.payments_outlined, color: AppColors.textPrimary),
              SizedBox(width: 12),
              Text(
                'Cash on delivery',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
