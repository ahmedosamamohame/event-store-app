import 'package:storeapp/core/error/failure_mapper.dart';
import 'package:storeapp/features/products/data/datasources/products_remote_data_source.dart';
import 'package:storeapp/features/products/domain/entities/product.dart';
import 'package:storeapp/features/products/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  const ProductsRepositoryImpl(this._remote);

  final ProductsRemoteDataSource _remote;

  @override
  Future<List<Product>> getProducts() async {
    try {
      return await _remote.fetchProducts();
    } catch (e) {
      throw mapToFailure(e);
    }
  }
}
