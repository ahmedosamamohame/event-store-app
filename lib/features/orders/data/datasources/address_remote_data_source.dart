import 'package:storeapp/features/orders/data/models/address_model.dart';
import 'package:storeapp/features/orders/domain/entities/geo_point.dart';

abstract class AddressRemoteDataSource {
  Future<AddressModel> fetchAddress(GeoPoint point);
}
