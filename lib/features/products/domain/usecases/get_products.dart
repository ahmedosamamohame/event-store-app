import 'package:storeapp/features/products/domain/entities/product.dart';
import 'package:storeapp/features/products/domain/repositories/products_repository.dart';

class GetProducts {
  const GetProducts(this._repository);

  final ProductsRepository _repository;

  Future<List<Product>> call() => _repository.getProducts();
}
