import 'dart:async';

import 'package:storeapp/core/error/data_failure.dart';
import 'package:storeapp/core/error/failure.dart';
import 'package:storeapp/core/error/network_failure.dart';
import 'package:storeapp/core/error/server_exception.dart';
import 'package:storeapp/core/error/server_failure.dart';
import 'package:storeapp/core/error/timeout_failure.dart';

/// Converts any low-level error into a [Failure]. Used by repositories only.
Failure mapToFailure(Object error) {
  if (error is Failure) return error;
  if (error is ServerException) return ServerFailure(error.statusCode);
  if (error is TimeoutException) return const TimeoutFailure();
  if (error is FormatException || error is TypeError) {
    return const DataFailure();
  }
  return const NetworkFailure();
}
