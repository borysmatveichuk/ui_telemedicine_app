import 'package:fpdart/fpdart.dart';

class AppException implements Exception {
  final String message;
  final int? errorCode;

  AppException(this.message, {this.errorCode});

  @override
  String toString() {
    final codeStr = errorCode != null ? ' (code: $errorCode)' : '';
    return 'AppException: $message$codeStr';
  }
}

typedef RepositoryResult<T> = Either<AppException, T>;
