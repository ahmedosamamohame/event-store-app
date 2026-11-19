import 'package:flutter/material.dart';
import 'package:storeapp/core/constants/app_layout.dart';

/// Centers [child] and stops it from growing wider than
/// [AppLayout.maxContentWidth].
class ContentWidth extends StatelessWidget {
  const ContentWidth({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppLayout.maxContentWidth),
        child: child,
      ),
    );
  }
}
