import 'package:storeapp/core/error/failure.dart';

class ServerFailure extends Failure {
  ServerFailure(int statusCode)
      : super('Request failed (status $statusCode).');
}
