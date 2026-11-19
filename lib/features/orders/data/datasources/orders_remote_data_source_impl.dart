import 'package:storeapp/core/constants/api_constants.dart';
import 'package:storeapp/core/network/api_client.dart';
import 'package:storeapp/features/orders/data/datasources/orders_remote_data_source.dart';
import 'package:storeapp/features/orders/data/models/order_request_model.dart';

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  const OrdersRemoteDataSourceImpl(this._api);

  final ApiClient _api;

  @override
  Future<void> createOrder(OrderRequestModel request) async {
    await _api.post(ApiConstants.carts, request.toJson());
  }
}
