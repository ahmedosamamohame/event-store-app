import 'package:flutter/material.dart';
import 'package:storeapp/core/widgets/content_width.dart';
import 'package:storeapp/core/widgets/shimmer_box.dart';

/// Pulsing placeholder of the home screen while products load.
class ProductsSkeleton extends StatelessWidget {
  const ProductsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentWidth(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ShimmerBox(height: 14, width: 220),
            const SizedBox(height: 28),
            const ShimmerBox(height: 40, width: 130),
            const SizedBox(height: 8),
            const ShimmerBox(height: 40, width: 250),
            const SizedBox(height: 24),
            const ShimmerBox(height: 240),
            const SizedBox(height: 12),
            const ShimmerBox(height: 16, width: 200),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(child: ShimmerBox(height: 190)),
                SizedBox(width: 12),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 28),
                    child: ShimmerBox(height: 190),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
