abstract class NetworkToolInterface {
  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> post({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  });
}
