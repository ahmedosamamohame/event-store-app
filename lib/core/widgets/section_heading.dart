import 'package:flutter/material.dart';
import 'package:storeapp/core/theme/app_colors.dart';
import 'package:storeapp/core/theme/app_text_styles.dart';
import 'package:storeapp/core/widgets/outlined_text.dart';

/// Giant page heading: the first word solid, the rest as an outline, with a
/// small gold count next to it.
class SectionHeading extends StatelessWidget {
  const SectionHeading({super.key, required this.title, required this.count});

  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    final words = title.toUpperCase().split(' ');
    final hasFirst = words.length > 1;
    final first = hasFirst ? words.first : '';
    final rest = hasFirst ? words.sublist(1).join(' ') : words.first;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 22, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hasFirst)
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                first,
                style: AppTextStyles.display.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: OutlinedText(rest, style: AppTextStyles.display),
                ),
              ),
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  '$count',
                  style: AppTextStyles.label.copyWith(
                    color: AppColors.accent,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
