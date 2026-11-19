import 'package:storeapp/core/error/failure_mapper.dart';
import 'package:storeapp/features/cart/domain/entities/cart_item.dart';
import 'package:storeapp/features/orders/data/datasources/orders_remote_data_source.dart';
import 'package:storeapp/features/orders/data/models/order_request_model.dart';
import 'package:storeapp/features/orders/domain/entities/customer_info.dart';
import 'package:storeapp/features/orders/domain/repositories/orders_repository.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  const OrdersRepositoryImpl(this._remote);

  final OrdersRemoteDataSource _remote;

  @override
  Future<void> submitOrder({
    required List<CartItem> items,
    required CustomerInfo customer,
    required DateTime date,
  }) async {
    try {
      await _remote.createOrder(
        OrderRequestModel(items: items, customer: customer, date: date),
      );
    } catch (e) {
      throw mapToFailure(e);
    }
  }
}
