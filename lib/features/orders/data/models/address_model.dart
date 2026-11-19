/// Address text built from a Nominatim reverse-geocoding answer.
class AddressModel {
  const AddressModel(this.text);

  final String text;

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    final address = json['address'];
    if (address is Map<String, dynamic>) {
      final parts = <String?>[
        _firstText(address, const ['house_number']),
        _firstText(address, const ['road', 'pedestrian', 'footway']),
        _firstText(
          address,
          const ['neighbourhood', 'suburb', 'quarter', 'city_district'],
        ),
        _firstText(address, const ['city', 'town', 'village', 'county']),
        _firstText(address, const ['state']),
      ].whereType<String>().toList();
      if (parts.isNotEmpty) return AddressModel(parts.join(', '));
    }

    final displayName = json['display_name'];
    return AddressModel(displayName is String ? displayName.trim() : '');
  }

  static String? _firstText(Map<String, dynamic> map, List<String> keys) {
    for (final key in keys) {
      final value = map[key];
      if (value is String && value.trim().isNotEmpty) return value.trim();
    }
    return null;
  }
}
