import 'package:equatable/equatable.dart';
import 'package:storeapp/features/cart/domain/entities/cart_item.dart';
import 'package:storeapp/features/orders/domain/entities/customer_info.dart';

class Order extends Equatable {
  const Order({
    required this.id,
    required this.date,
    required this.items,
    required this.customer,
  });

  final int id;
  final DateTime date;
  final List<CartItem> items;
  final CustomerInfo customer;

  double get total => items.fold<double>(0, (sum, item) => sum + item.subtotal);

  int get itemCount => items.fold<int>(0, (sum, item) => sum + item.quantity);

  @override
  List<Object?> get props => [id, date, items, customer];
}
