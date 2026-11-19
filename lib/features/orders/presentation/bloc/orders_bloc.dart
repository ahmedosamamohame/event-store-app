import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/core/error/failure.dart';
import 'package:storeapp/features/orders/domain/entities/order.dart';
import 'package:storeapp/features/orders/domain/usecases/place_order.dart';
import 'package:storeapp/features/orders/presentation/bloc/order_submitted.dart';
import 'package:storeapp/features/orders/presentation/bloc/orders_event.dart';
import 'package:storeapp/features/orders/presentation/bloc/orders_state.dart';
import 'package:storeapp/features/orders/presentation/bloc/place_order_status.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc(this._placeOrder) : super(const OrdersState()) {
    on<OrderSubmitted>(_onSubmitted);
  }

  final PlaceOrder _placeOrder;

  int _nextId = 1;

  Future<void> _onSubmitted(
    OrderSubmitted event,
    Emitter<OrdersState> emit,
  ) async {
    if (state.isSubmitting) return;
    emit(state.copyWith(status: PlaceOrderStatus.submitting));

    final date = DateTime.now();
    try {
      await _placeOrder(
        items: event.items,
        customer: event.customer,
        date: date,
      );
      final order = Order(
        id: _nextId++,
        date: date,
        items: List.of(event.items),
        customer: event.customer,
      );
      emit(
        state.copyWith(
          orders: [order, ...state.orders],
          status: PlaceOrderStatus.success,
        ),
      );
    } on Failure catch (failure) {
      emit(
        state.copyWith(
          status: PlaceOrderStatus.failure,
          errorMessage: failure.message,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: PlaceOrderStatus.failure,
          errorMessage: 'Could not place the order. Try again.',
        ),
      );
    }
  }
}
