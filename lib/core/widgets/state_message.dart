import 'package:flutter/material.dart';
import 'package:storeapp/core/theme/app_colors.dart';
import 'package:storeapp/core/theme/app_text_styles.dart';

/// Centered icon + title (+ message, + button) for empty and error states.
class StateMessage extends StatelessWidget {
  const StateMessage({
    super.key,
    required this.icon,
    required this.title,
    this.message,
    this.actionLabel,
    this.onAction,
  });

  final IconData icon;
  final String title;
  final String? message;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final message = this.message;
    final actionLabel = this.actionLabel;
    final onAction = this.onAction;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 88,
              width: 88,
              decoration: const BoxDecoration(
                color: AppColors.surface,
                shape: BoxShape.circle,
                border: Border.fromBorderSide(
                  BorderSide(color: AppColors.outline),
                ),
              ),
              child: Icon(icon, size: 38, color: AppColors.accent),
            ),
            const SizedBox(height: 22),
            Text(
              title.toUpperCase(),
              textAlign: TextAlign.center,
              style: AppTextStyles.sectionTitle.copyWith(fontSize: 18),
            ),
            if (message != null) ...[
              const SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ),
            ],
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: 26),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.cream,
                  foregroundColor: AppColors.ink,
                  minimumSize: const Size(190, 50),
                  shape: const RoundedRectangleBorder(),
                ),
                onPressed: onAction,
                child: Text(
                  actionLabel.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.4,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
