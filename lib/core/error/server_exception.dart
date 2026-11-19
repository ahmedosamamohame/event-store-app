/// Thrown by the data layer when the server answers with a non-2xx status.
class ServerException implements Exception {
  const ServerException(this.statusCode);

  final int statusCode;

  @override
  String toString() => 'ServerException($statusCode)';
}
