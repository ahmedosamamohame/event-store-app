import 'package:storeapp/core/error/validation_failure.dart';
import 'package:storeapp/features/cart/domain/entities/cart_item.dart';
import 'package:storeapp/features/orders/domain/entities/customer_info.dart';
import 'package:storeapp/features/orders/domain/repositories/orders_repository.dart';

class PlaceOrder {
  const PlaceOrder(this._repository);

  final OrdersRepository _repository;

  Future<void> call({
    required List<CartItem> items,
    required CustomerInfo customer,
    DateTime? date,
  }) async {
    if (items.isEmpty) {
      throw const ValidationFailure('Your cart is empty.');
    }
    await _repository.submitOrder(
      items: items,
      customer: customer,
      date: date ?? DateTime.now(),
    );
  }
}
