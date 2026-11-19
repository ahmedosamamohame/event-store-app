import 'package:equatable/equatable.dart';
import 'package:storeapp/features/orders/domain/entities/geo_point.dart';

class CustomerInfo extends Equatable {
  const CustomerInfo({
    required this.name,
    required this.phone,
    required this.address,
    required this.location,
    this.notes = '',
  });

  final String name;
  final String phone;
  final String address;
  final GeoPoint location;
  final String notes;

  @override
  List<Object?> get props => [name, phone, address, location, notes];
}
