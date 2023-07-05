class HttpError implements Exception {
  final String message;
  final int code;

  HttpError({required this.message, required this.code});
}
