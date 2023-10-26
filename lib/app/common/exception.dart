class ServerException implements Exception {
  final String mes;
  ServerException(this.mes);
}

class DatabaseException implements Exception {
  final String message;
  DatabaseException(this.message);
}

class CacheException implements Exception {
  final String message;
  CacheException(this.message);
}

class AppException implements Exception {
  final String message;
  AppException(this.message);
}
