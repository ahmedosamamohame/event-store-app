import 'package:geolocator/geolocator.dart';
import 'package:storeapp/core/error/location_failure.dart';
import 'package:storeapp/features/orders/data/datasources/device_location_data_source.dart';
import 'package:storeapp/features/orders/domain/entities/geo_point.dart';

/// Reads the device position with the `geolocator` package.
class DeviceLocationDataSourceImpl implements DeviceLocationDataSource {
  const DeviceLocationDataSourceImpl();

  @override
  Future<GeoPoint> readCurrentLocation() async {
    final enabled = await Geolocator.isLocationServiceEnabled();
    if (!enabled) {
      throw const LocationFailure(
        'Location is turned off. Turn it on and try again.',
      );
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied) {
      throw const LocationFailure('Location permission was denied.');
    }
    if (permission == LocationPermission.deniedForever) {
      throw const LocationFailure(
        'Location permission is blocked. Allow it from the settings.',
      );
    }

    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 15),
      ),
    );
    return GeoPoint(position.latitude, position.longitude);
  }
}
