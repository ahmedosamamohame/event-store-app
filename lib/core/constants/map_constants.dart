class MapConstants {
  const MapConstants._();

  static const String tileUrl = 'https://tile.openstreetmap.org/{z}/{x}/{y}.png';

  /// Change this to your real application id (OpenStreetMap asks for it).
  /// Android: `applicationId` in android/app/build.gradle(.kts).
  static const String userAgentPackage = 'PUT_YOUR_APPLICATION_ID_HERE';

  static const String attribution = 'OpenStreetMap contributors';

  /// Cairo, used when no location has been picked yet.
  static const double defaultLat = 30.0444;
  static const double defaultLng = 31.2357;
  static const double defaultZoom = 12;
  static const double pickedZoom = 16;

  static const double pinSize = 48;
}
