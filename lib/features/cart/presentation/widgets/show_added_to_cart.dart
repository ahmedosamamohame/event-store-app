import 'package:flutter/material.dart';
import 'package:storeapp/core/constants/app_routes.dart';

void showAddedToCart(BuildContext context) {
  final messenger = ScaffoldMessenger.of(context);
  final navigator = Navigator.of(context);
  messenger
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: const Text('Added to cart'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'View cart',
          onPressed: () => navigator.pushNamed(AppRoutes.cart),
        ),
      ),
    );
}
