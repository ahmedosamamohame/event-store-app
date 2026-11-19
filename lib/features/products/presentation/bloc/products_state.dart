import 'package:equatable/equatable.dart';
import 'package:storeapp/features/products/domain/entities/product.dart';
import 'package:storeapp/features/products/presentation/bloc/products_status.dart';

class ProductsState extends Equatable {
  const ProductsState({
    this.status = ProductsStatus.initial,
    this.products = const [],
    this.errorMessage,
  });

  final ProductsStatus status;
  final List<Product> products;
  final String? errorMessage;

  bool get isLoading => status == ProductsStatus.loading;

  bool get isFailure => status == ProductsStatus.failure;

  bool get hasProducts => products.isNotEmpty;

  /// [errorMessage] is replaced on every copy, so it never goes stale.
  ProductsState copyWith({
    ProductsStatus? status,
    List<Product>? products,
    String? errorMessage,
  }) {
    return ProductsState(
      status: status ?? this.status,
      products: products ?? this.products,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, products, errorMessage];
}
