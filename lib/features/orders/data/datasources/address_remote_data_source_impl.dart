import 'package:flutter/foundation.dart';
import 'package:storeapp/core/constants/geocoding_constants.dart';
import 'package:storeapp/core/network/api_client.dart';
import 'package:storeapp/features/orders/data/datasources/address_remote_data_source.dart';
import 'package:storeapp/features/orders/data/models/address_model.dart';
import 'package:storeapp/features/orders/domain/entities/geo_point.dart';

class AddressRemoteDataSourceImpl implements AddressRemoteDataSource {
  const AddressRemoteDataSourceImpl(this._api);

  final ApiClient _api;

  @override
  Future<AddressModel> fetchAddress(GeoPoint point) async {
    final data = await _api.get(
      GeocodingConstants.reverseUrl(point.lat, point.lng),
      // Browsers do not allow setting this header.
      headers: kIsWeb ? null : {'User-Agent': GeocodingConstants.userAgent},
    );
    if (data is! Map<String, dynamic>) {
      throw const FormatException('Expected an object');
    }
    return AddressModel.fromJson(data);
  }
}
