import 'package:equatable/equatable.dart';
import 'package:storeapp/features/orders/domain/entities/geo_point.dart';

class LocationPickerState extends Equatable {
  const LocationPickerState({
    this.point,
    this.isLocating = false,
    this.isConfirming = false,
    this.message,
    this.focusRequest = 0,
  });

  /// The pin (null until the user taps or the device location arrives).
  final GeoPoint? point;

  /// Reading the device location.
  final bool isLocating;

  /// Looking up the address after "Confirm".
  final bool isConfirming;

  /// Why the device location could not be read.
  final String? message;

  /// Increases each time the map should fly to [point].
  final int focusRequest;

  LocationPickerState copyWith({
    GeoPoint? point,
    bool? isLocating,
    bool? isConfirming,
    String? message,
    bool clearMessage = false,
    int? focusRequest,
  }) {
    return LocationPickerState(
      point: point ?? this.point,
      isLocating: isLocating ?? this.isLocating,
      isConfirming: isConfirming ?? this.isConfirming,
      message: clearMessage ? null : (message ?? this.message),
      focusRequest: focusRequest ?? this.focusRequest,
    );
  }

  @override
  List<Object?> get props =>
      [point, isLocating, isConfirming, message, focusRequest];
}
