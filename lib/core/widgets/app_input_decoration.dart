import 'package:flutter/material.dart';
import 'package:storeapp/core/theme/app_colors.dart';
import 'package:storeapp/core/theme/app_text_styles.dart';

UnderlineInputBorder _line(Color color, [double width = 1]) {
  return UnderlineInputBorder(borderSide: BorderSide(color: color, width: width));
}

/// Underlined field with a small uppercase label.
InputDecoration appInputDecoration(
  String label, {
  IconData? icon,
  String? errorText,
}) {
  return InputDecoration(
    labelText: label.toUpperCase(),
    errorText: errorText,
    labelStyle: AppTextStyles.label,
    floatingLabelStyle: AppTextStyles.label.copyWith(color: AppColors.accent),
    errorStyle: const TextStyle(color: AppColors.danger, fontSize: 12),
    prefixIcon:
        icon == null ? null : Icon(icon, size: 20, color: AppColors.textPrimary),
    filled: false,
    contentPadding: const EdgeInsets.symmetric(vertical: 16),
    border: _line(AppColors.textMuted),
    enabledBorder: _line(AppColors.textMuted),
    focusedBorder: _line(AppColors.accent, 2),
    errorBorder: _line(AppColors.danger),
    focusedErrorBorder: _line(AppColors.danger, 2),
  );
}
