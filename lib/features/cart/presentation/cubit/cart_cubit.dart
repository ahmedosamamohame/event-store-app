import 'dart:math' as math;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/features/cart/domain/entities/cart_item.dart';
import 'package:storeapp/features/cart/presentation/cubit/cart_state.dart';
import 'package:storeapp/features/products/domain/entities/product.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  static const int maxQuantity = 99;

  void add(Product product) {
    final exists = state.items.any((item) => item.product.id == product.id);
    if (!exists) {
      emit(
        CartState(
          items: [...state.items, CartItem(product: product, quantity: 1)],
        ),
      );
      return;
    }
    increment(product.id);
  }

  void increment(int productId) => _change(productId, 1);

  /// Going below 1 removes the item.
  void decrement(int productId) => _change(productId, -1);

  void remove(int productId) {
    emit(
      CartState(
        items: state.items
            .where((item) => item.product.id != productId)
            .toList(),
      ),
    );
  }

  void clear() => emit(const CartState());

  void _change(int productId, int delta) {
    final next = <CartItem>[];
    for (final item in state.items) {
      if (item.product.id != productId) {
        next.add(item);
        continue;
      }
      final quantity = math.min(item.quantity + delta, maxQuantity);
      if (quantity > 0) next.add(item.copyWith(quantity: quantity));
    }
    emit(CartState(items: next));
  }
}
