class WriteException implements Exception {
  String cause="Unable to write data";
}

class DeleteException implements Exception {
  String cause="Unable to delete data";
}

class ReadException implements Exception {
  String cause = "Unable to read data";
}

class HttpException implements Exception {
  int errorCode;

  HttpException(this.errorCode);
}

class NotSuccessException implements Exception {
  String message;

  NotSuccessException(message);
}

class InvalidCredentials implements Exception {
  String cause = "Email does not exits";
}