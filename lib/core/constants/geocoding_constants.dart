/// Reverse geocoding (coordinates -> address) with OpenStreetMap Nominatim.
class GeocodingConstants {
  const GeocodingConstants._();

  /// Nominatim asks apps to identify themselves (not possible on web).
  static const String userAgent = 'storeapp/1.0 (Flutter store app)';

  static String reverseUrl(double lat, double lng) {
    return 'https://nominatim.openstreetmap.org/reverse'
        '?format=jsonv2&addressdetails=1&zoom=18&accept-language=ar,en'
        '&lat=$lat&lon=$lng';
  }
}
