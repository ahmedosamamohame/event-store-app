import 'package:storeapp/features/orders/domain/entities/geo_point.dart';

abstract class AddressRepository {
  /// The written address of [point], or an empty string when none is found.
  /// Throws a `Failure` when the lookup fails.
  Future<String> addressFor(GeoPoint point);
}
