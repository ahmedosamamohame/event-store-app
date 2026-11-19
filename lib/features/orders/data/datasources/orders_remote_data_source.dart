import 'package:storeapp/features/orders/data/models/order_request_model.dart';

abstract class OrdersRemoteDataSource {
  Future<void> createOrder(OrderRequestModel request);
}
