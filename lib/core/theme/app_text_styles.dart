import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:storeapp/core/theme/app_colors.dart';

/// Text styles of the store look (Archivo, heavy and tightly tracked).
/// Colors come from [AppColors].
class AppTextStyles {
  const AppTextStyles._();

  static TextStyle get logo => GoogleFonts.getFont(
        'Archivo',
        fontSize: 18,
        fontWeight: FontWeight.w800,
        fontStyle: FontStyle.italic,
        letterSpacing: 1.5,
        color: AppColors.textPrimary,
      );

  static TextStyle get pageTitle => GoogleFonts.getFont(
        'Archivo',
        fontSize: 15,
        fontWeight: FontWeight.w900,
        letterSpacing: 1.8,
        color: AppColors.textPrimary,
      );

  /// Giant headline. Has no color on purpose: add one with `copyWith`, or
  /// draw it as an outline with OutlinedText.
  static TextStyle get display => GoogleFonts.getFont(
        'Archivo',
        fontSize: 44,
        fontWeight: FontWeight.w900,
        height: 0.92,
        letterSpacing: -2,
      );

  static TextStyle get sectionTitle => GoogleFonts.getFont(
        'Archivo',
        fontSize: 22,
        fontWeight: FontWeight.w900,
        letterSpacing: -0.5,
        height: 1.1,
        color: AppColors.textPrimary,
      );

  static TextStyle get label => GoogleFonts.getFont(
        'Archivo',
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.6,
        color: AppColors.textMuted,
      );

  static TextStyle get productName => GoogleFonts.getFont(
        'Archivo',
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.6,
        height: 1.3,
        color: AppColors.textPrimary,
      );

  static TextStyle get price => GoogleFonts.getFont(
        'Archivo',
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.accent,
      );
}
