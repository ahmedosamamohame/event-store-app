import 'package:storeapp/features/cart/domain/entities/cart_item.dart';
import 'package:storeapp/features/orders/domain/entities/customer_info.dart';

abstract class OrdersRepository {
  /// Sends the order to the server. Throws a `Failure` on error.
  Future<void> submitOrder({
    required List<CartItem> items,
    required CustomerInfo customer,
    required DateTime date,
  });
}
