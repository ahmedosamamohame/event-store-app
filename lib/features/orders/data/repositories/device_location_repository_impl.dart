import 'package:storeapp/core/error/failure_mapper.dart';
import 'package:storeapp/features/orders/data/datasources/device_location_data_source.dart';
import 'package:storeapp/features/orders/domain/entities/geo_point.dart';
import 'package:storeapp/features/orders/domain/repositories/device_location_repository.dart';

class DeviceLocationRepositoryImpl implements DeviceLocationRepository {
  const DeviceLocationRepositoryImpl(this._dataSource);

  final DeviceLocationDataSource _dataSource;

  @override
  Future<GeoPoint> currentLocation() async {
    try {
      return await _dataSource.readCurrentLocation();
    } catch (e) {
      throw mapToFailure(e);
    }
  }
}
