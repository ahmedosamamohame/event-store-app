import 'package:storeapp/core/error/failure_mapper.dart';
import 'package:storeapp/features/orders/data/datasources/address_remote_data_source.dart';
import 'package:storeapp/features/orders/domain/entities/geo_point.dart';
import 'package:storeapp/features/orders/domain/repositories/address_repository.dart';

class AddressRepositoryImpl implements AddressRepository {
  const AddressRepositoryImpl(this._remote);

  final AddressRemoteDataSource _remote;

  @override
  Future<String> addressFor(GeoPoint point) async {
    try {
      return (await _remote.fetchAddress(point)).text;
    } catch (e) {
      throw mapToFailure(e);
    }
  }
}
