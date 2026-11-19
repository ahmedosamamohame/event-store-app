import 'package:equatable/equatable.dart';

/// A plain latitude/longitude pair, so the domain does not depend on a map package.
class GeoPoint extends Equatable {
  const GeoPoint(this.lat, this.lng);

  final double lat;
  final double lng;

  @override
  List<Object?> get props => [lat, lng];
}
