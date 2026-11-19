import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/core/error/failure.dart';
import 'package:storeapp/features/orders/domain/entities/geo_point.dart';
import 'package:storeapp/features/orders/domain/entities/picked_location.dart';
import 'package:storeapp/features/orders/domain/usecases/get_address_for_location.dart';
import 'package:storeapp/features/orders/domain/usecases/get_current_location.dart';
import 'package:storeapp/features/orders/presentation/cubit/location_picker_state.dart';

class LocationPickerCubit extends Cubit<LocationPickerState> {
  LocationPickerCubit({
    GeoPoint? initial,
    required GetCurrentLocation getCurrentLocation,
    required GetAddressForLocation getAddress,
  })  : _getCurrentLocation = getCurrentLocation,
        _getAddress = getAddress,
        super(LocationPickerState(point: initial));

  final GetCurrentLocation _getCurrentLocation;
  final GetAddressForLocation _getAddress;

  void pick(GeoPoint point) {
    emit(state.copyWith(point: point, clearMessage: true));
  }

  /// Reads the device position, drops the pin on it and asks the map to fly
  /// there.
  Future<void> locate() async {
    if (state.isLocating) return;
    emit(state.copyWith(isLocating: true, clearMessage: true));
    try {
      final point = await _getCurrentLocation();
      if (isClosed) return;
      emit(
        state.copyWith(
          point: point,
          isLocating: false,
          focusRequest: state.focusRequest + 1,
        ),
      );
    } on Failure catch (failure) {
      if (isClosed) return;
      emit(state.copyWith(isLocating: false, message: failure.message));
    }
  }

  /// Looks up the address of the pin. A failed lookup still returns the pin
  /// (with an empty address) so the user can type the address by hand.
  Future<PickedLocation?> confirm() async {
    final point = state.point;
    if (point == null || state.isConfirming) return null;

    emit(state.copyWith(isConfirming: true));
    var address = '';
    try {
      address = await _getAddress(point);
    } on Failure {
      address = '';
    }
    if (!isClosed) emit(state.copyWith(isConfirming: false));
    return PickedLocation(point: point, address: address);
  }
}
