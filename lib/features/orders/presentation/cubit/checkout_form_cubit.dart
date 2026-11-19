import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/core/utils/validators.dart';
import 'package:storeapp/features/orders/domain/entities/customer_info.dart';
import 'package:storeapp/features/orders/domain/entities/geo_point.dart';
import 'package:storeapp/features/orders/presentation/cubit/checkout_form_state.dart';

class CheckoutFormCubit extends Cubit<CheckoutFormState> {
  CheckoutFormCubit() : super(const CheckoutFormState());

  void nameChanged(String value) => emit(state.copyWith(name: value));

  void phoneChanged(String value) => emit(state.copyWith(phone: value));

  void addressChanged(String value) => emit(state.copyWith(address: value));

  void notesChanged(String value) => emit(state.copyWith(notes: value));

  /// Saves the pin. A non-empty [address] (found from the pin) fills the
  /// address field, replacing what was typed.
  void locationPicked(GeoPoint value, {String address = ''}) {
    final text = address.trim();
    emit(
      state.copyWith(
        location: value,
        address: text.isEmpty ? null : text,
        addressVersion: text.isEmpty ? null : state.addressVersion + 1,
      ),
    );
  }

  /// Turns the error messages on. Returns the customer when the form is
  /// valid, otherwise null.
  CustomerInfo? submit() {
    final next = state.copyWith(showErrors: true);
    emit(next);

    final location = next.location;
    if (!next.isValid || location == null) return null;

    return CustomerInfo(
      name: next.name.trim(),
      phone: Validators.normalizePhone(next.phone.trim()),
      address: next.address.trim(),
      notes: next.notes.trim(),
      location: location,
    );
  }
}
