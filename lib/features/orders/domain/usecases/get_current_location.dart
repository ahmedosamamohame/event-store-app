import 'package:storeapp/features/orders/domain/entities/geo_point.dart';
import 'package:storeapp/features/orders/domain/repositories/device_location_repository.dart';

class GetCurrentLocation {
  const GetCurrentLocation(this._repository);

  final DeviceLocationRepository _repository;

  Future<GeoPoint> call() => _repository.currentLocation();
}
