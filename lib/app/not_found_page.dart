import 'package:flutter/material.dart';
import 'package:storeapp/core/widgets/state_message.dart';

/// Shown instead of a red error screen when a route does not exist or is
/// opened without the data it needs.
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NOT FOUND')),
      body: const StateMessage(
        icon: Icons.error_outline,
        title: 'Page not found',
        message: 'This page does not exist or its data is missing.',
      ),
    );
  }
}
