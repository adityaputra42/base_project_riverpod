import 'package:base_project/config/network/dio_service.dart';
import 'package:base_project/config/network/interceptor/logging_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import 'api_service.dart';

class DioApiClient {
  static Dio? _instance;
  Dio dio = Dio();

  static Dio? getDio() {
    if (_instance == null) {
      var options = BaseOptions(
        baseUrl: '',
        receiveDataWhenStatusError: true,
        validateStatus: (statusCode) => statusCode! < 500,
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 3000),
      );
      _instance = Dio(options);
    }
    return _instance;
  }

  static DioService getDioService() {
    final dio = getDio();
    final cacheOptions = CacheOptions(
      store: MemCacheStore(),
      policy: CachePolicy.noCache,
      maxStale: const Duration(days: 30),
      keyBuilder: (options) => options.path,
    );
    return DioService(
      dioClient: dio!,
      globalCacheOptions: cacheOptions,
      interceptors: [LoggingInterceptor()],
    );
  }

  static ApiService getApiService() {
    final dioService = getDioService();
    return ApiService(dioService);
  }
}
