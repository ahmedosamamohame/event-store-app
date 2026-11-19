import 'package:flutter/material.dart';

/// THE ONLY FILE THAT CONTAINS COLORS.
///
/// Every screen and widget reads its colors from here, so changing a value in
/// this file re-colors the whole app. Do not write `Color(...)` or `Colors.x`
/// anywhere else.
class AppColors {
  const AppColors._();

  // Base
  static const Color transparent = Color(0x00000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color ink = Color(0xFF0A0A0A);
  static const Color cream = Color(0xFFF2EEE6);

  // Surfaces (near-black)
  static const Color background = ink;
  static const Color surface = Color(0xFF141414);
  static const Color surfaceHigh = Color(0xFF1C1C1C);
  static const Color outline = Color(0xFF2A2A2A);

  // Accent (gold): prices, selected tab, highlights
  static const Color accent = Color(0xFFE3B04B);
  static const Color onAccent = ink;

  // Sale / error / favorite
  static const Color danger = Color(0xFFE5252A);

  // Text on dark
  static const Color textPrimary = cream;
  static const Color textSecondary = Color(0xFFB9B5AB);
  static const Color textMuted = Color(0xFF8A867D);

  /// Light warm panel behind product photos. Photos are blended into it
  /// (see AppNetworkImage), so their white backgrounds disappear.
  static const Color imagePanel = Color(0xFFE9E5DC);

  /// Big faint number printed on the panel.
  static const Color panelNumeral = Color(0xFFDAD5C9);
}
