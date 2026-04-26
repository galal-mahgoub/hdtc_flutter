class EmptyCacheException implements Exception {}

class UnAuthenticatedException implements Exception {
  String message;
  UnAuthenticatedException({
    required this.message,
  });
}

class ValidationException implements Exception {
  String message;
  ValidationException({
    required this.message,
  });
}

class UnVerifiedException implements Exception {
  String message;
  UnVerifiedException({
    required this.message,
  });
}

class UnExpectedException implements Exception {}

class ServerException implements Exception {}

class AuthException implements Exception {
  String message;
  AuthException({
    required this.message,
  });
}
