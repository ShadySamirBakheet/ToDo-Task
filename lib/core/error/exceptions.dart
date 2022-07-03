class NetworkConnectionException implements Exception {}

class InvalidData implements Exception {
  InvalidData(this._errors, this.msg);
  final Map<String, dynamic>? _errors;
  String? msg;

  Map<String, dynamic>? get errors => _errors;
}

class ServerError implements Exception {}

class EmptyListException implements Exception {}

class AuthError implements Exception {}

class RefreshTokenError implements Exception {}

class CacheError implements Exception {}

class SomeThingWentWrong implements Exception {}

class NotFoundError implements Exception {}

class BadRequestError implements Exception {}
