import 'package:flutter/material.dart';
import 'package:storeapp/app/not_found_page.dart';
import 'package:storeapp/core/constants/app_routes.dart';
import 'package:storeapp/features/cart/presentation/pages/cart_page.dart';
import 'package:storeapp/features/orders/domain/entities/geo_point.dart';
import 'package:storeapp/features/orders/domain/entities/picked_location.dart';
import 'package:storeapp/features/orders/presentation/pages/checkout_page.dart';
import 'package:storeapp/features/orders/presentation/pages/location_picker_page.dart';
import 'package:storeapp/features/orders/presentation/pages/orders_page.dart';
import 'package:storeapp/features/products/domain/entities/product.dart';
import 'package:storeapp/features/products/presentation/pages/home_page.dart';
import 'package:storeapp/features/products/presentation/pages/product_details_page.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return _route<dynamic>(settings, const HomePage());
      case AppRoutes.product:
        return _productRoute(settings);
      case AppRoutes.cart:
        return _route<dynamic>(settings, const CartPage());
      case AppRoutes.checkout:
        return _route<dynamic>(settings, const CheckoutPage());
      case AppRoutes.orders:
        return _route<dynamic>(settings, const OrdersPage());
      case AppRoutes.pickLocation:
        return _pickLocationRoute(settings);
      default:
        return _route<dynamic>(settings, const NotFoundPage());
    }
  }

  static Route<dynamic> _productRoute(RouteSettings settings) {
    final args = settings.arguments;
    if (args is! Product) {
      return _route<dynamic>(settings, const NotFoundPage());
    }
    return _route<dynamic>(settings, ProductDetailsPage(product: args));
  }

  /// This route returns a [PickedLocation] to the page that opened it, so its
  /// type argument must be [PickedLocation] (not dynamic) for
  /// `Navigator.pushNamed<PickedLocation>`. The optional argument is the
  /// [GeoPoint] where the map starts.
  static Route<dynamic> _pickLocationRoute(RouteSettings settings) {
    final args = settings.arguments;
    return _route<PickedLocation>(
      settings,
      LocationPickerPage(initial: args is GeoPoint ? args : null),
    );
  }

  static MaterialPageRoute<T> _route<T>(RouteSettings settings, Widget page) {
    return MaterialPageRoute<T>(settings: settings, builder: (_) => page);
  }
}
