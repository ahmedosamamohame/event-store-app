import 'package:storeapp/features/cart/domain/entities/cart_item.dart';
import 'package:storeapp/features/orders/domain/entities/customer_info.dart';
import 'package:storeapp/features/orders/presentation/bloc/orders_event.dart';

/// The user pressed "Place order" with a valid form.
class OrderSubmitted extends OrdersEvent {
  const OrderSubmitted({required this.items, required this.customer});

  final List<CartItem> items;
  final CustomerInfo customer;

  @override
  List<Object?> get props => [items, customer];
}
