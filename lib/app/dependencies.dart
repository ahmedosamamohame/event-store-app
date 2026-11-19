import 'package:http/http.dart' as http;
import 'package:storeapp/core/network/api_client.dart';
import 'package:storeapp/features/orders/data/datasources/address_remote_data_source_impl.dart';
import 'package:storeapp/features/orders/data/datasources/device_location_data_source_impl.dart';
import 'package:storeapp/features/orders/data/datasources/orders_remote_data_source_impl.dart';
import 'package:storeapp/features/orders/data/repositories/address_repository_impl.dart';
import 'package:storeapp/features/orders/data/repositories/device_location_repository_impl.dart';
import 'package:storeapp/features/orders/data/repositories/orders_repository_impl.dart';
import 'package:storeapp/features/orders/domain/usecases/get_address_for_location.dart';
import 'package:storeapp/features/orders/domain/usecases/get_current_location.dart';
import 'package:storeapp/features/orders/domain/usecases/place_order.dart';
import 'package:storeapp/features/products/data/datasources/products_remote_data_source_impl.dart';
import 'package:storeapp/features/products/data/repositories/products_repository_impl.dart';
import 'package:storeapp/features/products/domain/usecases/get_products.dart';

/// Wires data -> domain. This is the only place that knows about the
/// concrete implementations.
class Dependencies {
  Dependencies._({
    required this.getProducts,
    required this.placeOrder,
    required this.getCurrentLocation,
    required this.getAddressForLocation,
  });

  factory Dependencies.create({http.Client? client}) {
    final api = ApiClient(client: client);

    final productsRepository =
        ProductsRepositoryImpl(ProductsRemoteDataSourceImpl(api));
    final ordersRepository =
        OrdersRepositoryImpl(OrdersRemoteDataSourceImpl(api));

    return Dependencies._(
      getProducts: GetProducts(productsRepository),
      placeOrder: PlaceOrder(ordersRepository),
      getCurrentLocation: GetCurrentLocation(
        const DeviceLocationRepositoryImpl(DeviceLocationDataSourceImpl()),
      ),
      getAddressForLocation: GetAddressForLocation(
        AddressRepositoryImpl(AddressRemoteDataSourceImpl(api)),
      ),
    );
  }

  final GetProducts getProducts;
  final PlaceOrder placeOrder;
  final GetCurrentLocation getCurrentLocation;
  final GetAddressForLocation getAddressForLocation;
}
