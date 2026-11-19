import 'package:flutter/material.dart';
import 'package:storeapp/core/theme/app_colors.dart';

/// Product photo for use on top of [AppColors.imagePanel]. The photo is
/// blended into the panel color so its white background disappears.
class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage(this.url, {super.key, this.iconSize = 32});

  final String url;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.contain,
      color: AppColors.imagePanel,
      colorBlendMode: BlendMode.darken,
      // On Flutter web, images from servers without CORS headers would fail
      // to load. This falls back to a plain <img> element instead.
      webHtmlElementStrategy: WebHtmlElementStrategy.fallback,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return const Center(
          child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) => Icon(
        Icons.broken_image_outlined,
        size: iconSize,
        color: AppColors.textMuted,
      ),
    );
  }
}
