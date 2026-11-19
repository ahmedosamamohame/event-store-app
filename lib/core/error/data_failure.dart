import 'package:storeapp/core/error/failure.dart';

class DataFailure extends Failure {
  const DataFailure() : super('Received unexpected data from the server.');
}
