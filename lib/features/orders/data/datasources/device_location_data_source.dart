import 'package:storeapp/features/orders/domain/entities/geo_point.dart';

abstract class DeviceLocationDataSource {
  Future<GeoPoint> readCurrentLocation();
}
