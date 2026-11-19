import 'package:equatable/equatable.dart';
import 'package:storeapp/features/cart/domain/entities/cart_item.dart';

class CartState extends Equatable {
  const CartState({this.items = const []});

  final List<CartItem> items;

  bool get isEmpty => items.isEmpty;

  int get itemCount => items.fold<int>(0, (sum, item) => sum + item.quantity);

  double get total => items.fold<double>(0, (sum, item) => sum + item.subtotal);

  @override
  List<Object?> get props => [items];
}
