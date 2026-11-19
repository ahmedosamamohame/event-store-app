import 'package:equatable/equatable.dart';
import 'package:storeapp/features/orders/domain/entities/geo_point.dart';

/// What the map screen returns: the pin and its written address
/// (empty when the address could not be found).
class PickedLocation extends Equatable {
  const PickedLocation({required this.point, this.address = ''});

  final GeoPoint point;
  final String address;

  @override
  List<Object?> get props => [point, address];
}
