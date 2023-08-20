
import 'package:base_project/data/model/network/api_response_data.dart';

abstract class AuthRepository {
  Future<ApiResponseData> login({required dynamic body});

  Future<ApiResponseData> register({required dynamic body});

  Future<void> logout();

  Future<ApiResponseData> forgotPassword({required dynamic body});
}