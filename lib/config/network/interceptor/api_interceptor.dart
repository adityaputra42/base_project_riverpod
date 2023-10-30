import 'package:dio/dio.dart';

import '../../../utils/util.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor() : super();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra.containsKey('requiresAuthToken')) {
      if (options.extra['requiresAuthToken'] == true) {
        final token = PrefHelper.instance.token;
        options.headers.addAll(
          <String, Object?>{'Authorization': 'Bearer $token'},
        );
      }
      options.extra.remove('requiresAuthToken');
    }
    return handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    final success = response.data['headers']['error'] == 0;
    if (success) return handler.next(response);
    return handler.reject(
      DioException(
        requestOptions: response.requestOptions,
        response: response,
      ),
    );
  }
}
