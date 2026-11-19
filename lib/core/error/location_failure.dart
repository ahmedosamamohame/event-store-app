import 'package:storeapp/core/error/failure.dart';

/// The device location could not be read (GPS off, permission denied...).
class LocationFailure extends Failure {
  const LocationFailure(super.message);
}
