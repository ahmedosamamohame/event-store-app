import 'package:equatable/equatable.dart';
import 'package:storeapp/core/utils/validators.dart';
import 'package:storeapp/features/orders/domain/entities/geo_point.dart';

/// Everything typed on the checkout form. Errors are only shown after the
/// user pressed "Place order" once ([showErrors]); after that they update live.
class CheckoutFormState extends Equatable {
  const CheckoutFormState({
    this.name = '',
    this.phone = '',
    this.address = '',
    this.notes = '',
    this.location,
    this.showErrors = false,
    this.addressVersion = 0,
  });

  final String name;
  final String phone;
  final String address;
  final String notes;
  final GeoPoint? location;
  final bool showErrors;

  /// Increases when the address is filled from the map, so the text field
  /// knows to show the new text.
  final int addressVersion;

  String? get nameError => showErrors ? Validators.name(name) : null;

  String? get phoneError => showErrors ? Validators.phone(phone) : null;

  String? get addressError => showErrors ? Validators.address(address) : null;

  bool get hasLocationError => showErrors && location == null;

  bool get isValid =>
      Validators.name(name) == null &&
      Validators.phone(phone) == null &&
      Validators.address(address) == null &&
      location != null;

  CheckoutFormState copyWith({
    String? name,
    String? phone,
    String? address,
    String? notes,
    GeoPoint? location,
    bool? showErrors,
    int? addressVersion,
  }) {
    return CheckoutFormState(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      notes: notes ?? this.notes,
      location: location ?? this.location,
      showErrors: showErrors ?? this.showErrors,
      addressVersion: addressVersion ?? this.addressVersion,
    );
  }

  @override
  List<Object?> get props =>
      [name, phone, address, notes, location, showErrors, addressVersion];
}
