import 'package:equatable/equatable.dart';
import 'package:storeapp/features/orders/domain/entities/order.dart';
import 'package:storeapp/features/orders/presentation/bloc/place_order_status.dart';

class OrdersState extends Equatable {
  const OrdersState({
    this.orders = const [],
    this.status = PlaceOrderStatus.idle,
    this.errorMessage,
  });

  final List<Order> orders;
  final PlaceOrderStatus status;
  final String? errorMessage;

  bool get isSubmitting => status == PlaceOrderStatus.submitting;

  /// [errorMessage] is replaced on every copy, so it never goes stale.
  OrdersState copyWith({
    List<Order>? orders,
    PlaceOrderStatus? status,
    String? errorMessage,
  }) {
    return OrdersState(
      orders: orders ?? this.orders,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [orders, status, errorMessage];
}
