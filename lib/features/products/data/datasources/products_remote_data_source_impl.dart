import 'package:storeapp/core/constants/api_constants.dart';
import 'package:storeapp/core/network/api_client.dart';
import 'package:storeapp/features/products/data/datasources/products_remote_data_source.dart';
import 'package:storeapp/features/products/data/models/product_model.dart';

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  const ProductsRemoteDataSourceImpl(this._api);

  final ApiClient _api;

  @override
  Future<List<ProductModel>> fetchProducts() async {
    final data = await _api.get(ApiConstants.products);
    if (data is! List) throw const FormatException('Expected a list');
    return data
        .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
