import 'package:storeapp/features/orders/domain/entities/geo_point.dart';
import 'package:storeapp/features/orders/domain/repositories/address_repository.dart';

class GetAddressForLocation {
  const GetAddressForLocation(this._repository);

  final AddressRepository _repository;

  Future<String> call(GeoPoint point) => _repository.addressFor(point);
}
