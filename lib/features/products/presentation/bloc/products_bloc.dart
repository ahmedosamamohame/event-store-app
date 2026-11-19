import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/core/error/failure.dart';
import 'package:storeapp/features/products/domain/usecases/get_products.dart';
import 'package:storeapp/features/products/presentation/bloc/products_event.dart';
import 'package:storeapp/features/products/presentation/bloc/products_load_requested.dart';
import 'package:storeapp/features/products/presentation/bloc/products_state.dart';
import 'package:storeapp/features/products/presentation/bloc/products_status.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc(this._getProducts) : super(const ProductsState()) {
    on<ProductsLoadRequested>(_onLoadRequested);
  }

  final GetProducts _getProducts;

  Future<void> _onLoadRequested(
    ProductsLoadRequested event,
    Emitter<ProductsState> emit,
  ) async {
    if (state.isLoading) return;
    emit(state.copyWith(status: ProductsStatus.loading));

    try {
      final products = await _getProducts();
      emit(state.copyWith(status: ProductsStatus.success, products: products));
    } on Failure catch (failure) {
      emit(
        state.copyWith(
          status: ProductsStatus.failure,
          errorMessage: failure.message,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: ProductsStatus.failure,
          errorMessage: 'Something went wrong. Try again.',
        ),
      );
    }
  }
}
