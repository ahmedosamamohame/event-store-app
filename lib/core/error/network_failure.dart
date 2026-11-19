import 'package:storeapp/core/error/failure.dart';

class NetworkFailure extends Failure {
  const NetworkFailure()
      : super('Could not connect. Check your internet and try again.');
}
