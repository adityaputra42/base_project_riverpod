import 'package:base_project/config/network/dio_api_client.dart';
import 'package:base_project/data/model/network/api_response_data.dart';
import 'package:base_project/domain/repository/repository.dart';
import 'package:dio/dio.dart';

class AuthController implements AuthRepository {
  final apiClient = DioApiClient.getInstance();
  @override
  Future<ApiResponseData> forgotPassword({required dynamic body}) async {
    try {
      var response = await apiClient?.post('forgotPassword', data: body);
      return ApiResponseData(
        statusCode: response?.statusCode,
        body: response?.data,
      );
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<ApiResponseData> login({required dynamic body}) async {
    try {
      var response = await apiClient?.post('login', data: body);
      return ApiResponseData(
        statusCode: response?.statusCode,
        body: response?.data,
      );
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<void> logout() async {
    try {
      await apiClient?.post(
        'logout',
      );
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<ApiResponseData> register({required dynamic body}) async {
    try {
      var response = await apiClient?.post('register', data: body);
      return ApiResponseData(
        statusCode: response?.statusCode,
        body: response?.data,
      );
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
