import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:eds_test/core/config/logging/dio_interceptor.dart';
import 'package:eds_test/core/failures/failure.dart';
import 'package:eds_test/dependency_injection.dart';
import 'package:eds_test/shared/services/network_tool/network_interface.dart';

class DioNetworkTool implements NetworkToolInterface {
  late final Dio dio = injection.get();
  DioNetworkTool() {
    dio.interceptors
      ..add(DioIntercepter())
      ..add(
        DioCacheInterceptor(
          options: CacheOptions(
            store: MemCacheStore(),
            policy: CachePolicy.refreshForceCache,
            hitCacheOnErrorExcept: [],
            maxStale: const Duration(
              days: 1,
            ),
            priority: CachePriority.high,
          ),
        ),
      );
  }
  @override
  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get<dynamic>(
        path,
        queryParameters: queryParameters,
      );
      if (isSuccess(response.statusCode!)) {
        return response.data;
      } else {
        throw HttpError(
          message: response.statusMessage ?? 'Unknown error',
          code: response.statusCode ?? 0,
        );
      }
    } on DioError catch (e) {
      throw HttpError(
        message: e.message ?? 'Unknown error',
        code: e.response?.statusCode ?? 0,
      );
    }
  }

  @override
  Future<dynamic> post({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await dio.post<dynamic>(
        path,
        queryParameters: queryParameters,
        data: body,
      );
      if (isSuccess(response.statusCode!)) {
        return response.data;
      } else {
        throw HttpError(
          message: response.statusMessage ?? 'Unknown error',
          code: response.statusCode ?? 0,
        );
      }
    } on DioError catch (e) {
      throw HttpError(
        message: e.message ?? 'Unknown error',
        code: e.response?.statusCode ?? 0,
      );
    }
  }
}

bool isSuccess(int statusCode) => statusCode >= 200 && statusCode < 300;
