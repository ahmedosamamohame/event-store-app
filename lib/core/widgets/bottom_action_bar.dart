import 'package:flutter/material.dart';
import 'package:storeapp/core/constants/app_layout.dart';

/// Bar for `Scaffold.bottomNavigationBar` (or the bottom of a Column) that
/// respects the safe area and the maximum content width.
class BottomActionBar extends StatelessWidget {
  const BottomActionBar({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.fromLTRB(16, 12, 16, 12),
    this.decoration,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: decoration,
      child: SafeArea(
        child: Center(
          heightFactor: 1,
          child: ConstrainedBox(
            constraints:
                const BoxConstraints(maxWidth: AppLayout.maxContentWidth),
            child: Padding(padding: padding, child: child),
          ),
        ),
      ),
    );
  }
}
