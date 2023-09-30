class AppException implements Exception {
  final dynamic _message;
  final dynamic _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([message]) : super(message, "");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Bad Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorized: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([message]) : super(message, "Invalid Input: ");
}

class TimeOutException extends AppException {
  TimeOutException([message]) : super(message, "Timeout: ");
}

class NotFoundException extends AppException {
  NotFoundException([message]) : super(message, "Not Found: ");
}

class ServerErrorException extends AppException {
  ServerErrorException([message]) : super(message, "Internal Server Error: ");
}

class NetworkException extends AppException {
  NetworkException([message]) : super(message, "Network Error: ");
}

class DatabaseException extends AppException {
  DatabaseException([message]) : super(message, "Database Error: ");
}
