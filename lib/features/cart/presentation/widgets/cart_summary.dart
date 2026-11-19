import 'package:flutter/material.dart';
import 'package:storeapp/core/constants/app_routes.dart';
import 'package:storeapp/core/theme/app_colors.dart';
import 'package:storeapp/core/theme/app_text_styles.dart';
import 'package:storeapp/core/utils/format.dart';
import 'package:storeapp/core/widgets/bottom_action_bar.dart';
import 'package:storeapp/core/widgets/primary_button.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({super.key, required this.total});

  final double total;

  @override
  Widget build(BuildContext context) {
    return BottomActionBar(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(top: BorderSide(color: AppColors.outline)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('TOTAL', style: AppTextStyles.label),
              const Spacer(),
              Text(
                formatPrice(total),
                style: AppTextStyles.price.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            text: 'Checkout',
            icon: Icons.arrow_forward_rounded,
            onPressed: () => Navigator.pushNamed(context, AppRoutes.checkout),
          ),
        ],
      ),
    );
  }
}
