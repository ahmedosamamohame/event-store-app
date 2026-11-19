import 'package:flutter/material.dart';
import 'package:storeapp/core/theme/app_colors.dart';
import 'package:storeapp/core/theme/app_text_styles.dart';

/// Numbered section heading, e.g. "01  CONTACT".
class CheckoutSectionTitle extends StatelessWidget {
  const CheckoutSectionTitle(this.text, {super.key, required this.number});

  final String text;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            number,
            style: AppTextStyles.label.copyWith(
              color: AppColors.accent,
              fontSize: 13,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            text.toUpperCase(),
            style: AppTextStyles.sectionTitle.copyWith(
              fontSize: 17,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
