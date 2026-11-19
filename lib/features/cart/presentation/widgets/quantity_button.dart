import 'package:flutter/material.dart';
import 'package:storeapp/core/theme/app_colors.dart';

/// Small square "+" / "-" button with a thin border.
class QuantityButton extends StatelessWidget {
  const QuantityButton({super.key, required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: AppColors.textMuted),
      ),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 32,
          width: 32,
          child: Icon(icon, size: 16, color: AppColors.textPrimary),
        ),
      ),
    );
  }
}
