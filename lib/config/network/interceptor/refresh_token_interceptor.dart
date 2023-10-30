import 'package:base_project/config/network/network.dart';
import 'package:dio/dio.dart';

import '../../../utils/helper/typedefs.dart';

class RefreshTokenInterceptor extends Interceptor {
  final Dio _dio;
  RefreshTokenInterceptor({
    required Dio dioClient,
  }) : _dio = dioClient;

  String get tokenExpiredException => 'TokenExpiredException';

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response != null) {
      if (err.response!.data != null) {
        final headers = err.response!.data['headers'] as JSON;

        // Check error type to be token expired error
        final code = headers['code'] as String;
        if (code == tokenExpiredException) {
          final tokenDio = Dio()..options = _dio.options;

          final newToken = await _refreshTokenRequest(
            dioError: err,
            handler: handler,
            tokenDio: tokenDio,
            data: {},
          );

          if (newToken == null) return super.onError(err, handler);

          final response = await _dio.request<JSON>(
            err.requestOptions.path,
            data: err.requestOptions.data,
            cancelToken: err.requestOptions.cancelToken,
            options: Options(
              headers: <String, Object?>{'Authorization': 'Bearer $newToken'},
            ),
          );
          return handler.resolve(response);
        }
      }
    }

    return super.onError(err, handler);
  }

  Future<String?> _refreshTokenRequest({
    required DioException dioError,
    required ErrorInterceptorHandler handler,
    required Dio tokenDio,
    required JSON data,
  }) async {
    try {
      final response = await tokenDio.post<JSON>(
        "Endpoint",
        data: data,
      );

      final success = response.data?['headers']['error'] == 0;

      if (success) {
        return response.data?['body']['token'] as String;
      } else {
        throw Exception(response.data?['headers']['message']);
      }
    } on DioException catch (ex) {
      throw ApiException().getExceptionMessage(ex);
    }
  }
}
