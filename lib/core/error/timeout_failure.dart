import 'package:storeapp/core/error/failure.dart';

class TimeoutFailure extends Failure {
  const TimeoutFailure()
      : super('The server is taking too long to respond. Try again.');
}
