import 'package:storeapp/features/products/domain/entities/product.dart';

abstract class ProductsRepository {
  /// Throws a `Failure` when the products cannot be loaded.
  Future<List<Product>> getProducts();
}
