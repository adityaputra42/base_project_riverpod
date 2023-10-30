import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import '../../utils/helper/typedefs.dart';
import 'api_exception.dart';
import './api_interface.dart';
import './dio_service.dart';
import 'response_model.dart';

class ApiService implements ApiInterface {
  late final DioService _dioService;
  ApiService(DioService dioService) : _dioService = dioService;

  @override
  Future<List<T>> getCollectionData<T>({
    required String endpoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    CachePolicy? cachePolicy,
    int? cacheAgeDays,
    bool requiresAuthToken = true,
    required T Function(JSON responseBody) converter,
  }) async {
    List<Object?> body;
    try {
      final data = await _dioService.get<List<Object?>>(
        endpoint: endpoint,
        cacheOptions: _dioService.globalCacheOptions?.copyWith(
          policy: cachePolicy,
          maxStale: cacheAgeDays != null
              ? Nullable(Duration(days: cacheAgeDays))
              : null,
        ),
        options: Options(
          extra: <String, Object?>{
            'requiresAuthToken': requiresAuthToken,
          },
        ),
        queryParams: queryParams,
        cancelToken: cancelToken,
      );
      body = data.body;
    } on DioException catch (ex) {
      throw ApiException().getExceptionMessage(ex);
    }

    try {
      return body.map((dataMap) => converter(dataMap! as JSON)).toList();
    } on DioException catch (ex) {
      throw ApiException().getExceptionMessage(ex);
    }
  }

  @override
  Future<T> getDocumentData<T>({
    required String endpoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    CachePolicy? cachePolicy,
    int? cacheAgeDays,
    bool requiresAuthToken = true,
    required T Function(JSON response) converter,
  }) async {
    JSON body;
    try {
      final data = await _dioService.get<JSON>(
        endpoint: endpoint,
        queryParams: queryParams,
        cacheOptions: _dioService.globalCacheOptions?.copyWith(
          policy: cachePolicy,
          maxStale: cacheAgeDays != null
              ? Nullable(Duration(days: cacheAgeDays))
              : null,
        ),
        options: Options(
          extra: <String, Object?>{
            'requiresAuthToken': requiresAuthToken,
          },
        ),
        cancelToken: cancelToken,
      );

      body = data.body;
    } on DioException catch (ex) {
      throw ApiException().getExceptionMessage(ex);
    }

    try {
      // Returning the deserialized object
      return converter(body);
    } on DioException catch (ex) {
      throw ApiException().getExceptionMessage(ex);
    }
  }

  @override
  Future<T> setData<T>({
    required String endpoint,
    required JSON data,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(ResponseModel<JSON> response) converter,
  }) async {
    ResponseModel<JSON> response;

    try {
      // Entire map of response
      response = await _dioService.post<JSON>(
        endpoint: endpoint,
        data: data,
        options: Options(
          extra: <String, Object?>{
            'requiresAuthToken': requiresAuthToken,
          },
        ),
        cancelToken: cancelToken,
      );
    } on DioException catch (ex) {
      throw ApiException().getExceptionMessage(ex);
    }

    try {
      // Returning the serialized object
      return converter(response);
    } on DioException catch (ex) {
      throw ApiException().getExceptionMessage(ex);
    }
  }

  @override
  Future<T> updateData<T>({
    required String endpoint,
    required JSON data,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(ResponseModel<JSON> response) converter,
  }) async {
    ResponseModel<JSON> response;

    try {
      // Entire map of response
      response = await _dioService.patch<JSON>(
        endpoint: endpoint,
        data: data,
        options: Options(
          extra: <String, Object?>{
            'requiresAuthToken': requiresAuthToken,
          },
        ),
        cancelToken: cancelToken,
      );
    } on DioException catch (ex) {
      throw ApiException().getExceptionMessage(ex);
    }

    try {
      // Returning the serialized object
      return converter(response);
    } on DioException catch (ex) {
      throw ApiException().getExceptionMessage(ex);
    }
  }

  @override
  Future<T> deleteData<T>({
    required String endpoint,
    JSON? data,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(ResponseModel<JSON> response) converter,
  }) async {
    ResponseModel<JSON> response;

    try {
      // Entire map of response
      response = await _dioService.delete<JSON>(
        endpoint: endpoint,
        data: data,
        options: Options(
          extra: <String, Object?>{
            'requiresAuthToken': requiresAuthToken,
          },
        ),
        cancelToken: cancelToken,
      );
    } on DioException catch (ex) {
      throw ApiException().getExceptionMessage(ex);
    }

    try {
      // Returning the serialized object
      return converter(response);
    } on DioException catch (ex) {
      throw ApiException().getExceptionMessage(ex);
    }
  }

  @override
  void cancelRequests({CancelToken? cancelToken}) {
    _dioService.cancelRequests(cancelToken: cancelToken);
  }
}
