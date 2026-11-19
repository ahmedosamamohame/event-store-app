import 'package:storeapp/features/orders/domain/entities/geo_point.dart';

abstract class DeviceLocationRepository {
  /// Throws a `Failure` when the location cannot be read.
  Future<GeoPoint> currentLocation();
}
