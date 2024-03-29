class HttpException implements Exception {
  String message;
  final int statusCode;
  HttpException(this.message, this.statusCode);

  @override
  String toString() {
    errorhandles(statusCode);
    return message;
  }

  void errorhandles(int statusCode) {
    if (statusCode >= 400 && statusCode < 451) {
      clientError(statusCode);
      return;
    }
    if (statusCode >=500 && statusCode < 512) {
      serverError(statusCode);
      return;
    }
  }

  void clientError(int statusCode) {
     message = 'Client side error';
  }

  void serverError(int statusCode) {
    message = 'server error';
  }
}
