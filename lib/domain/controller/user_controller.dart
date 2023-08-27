import 'package:base_project/data/model/network/api_response_data.dart';
import 'package:base_project/domain/repository/repository.dart';
import 'package:dio/dio.dart';

import '../../config/config.dart';

class UserController implements UserRepository {
  final apiClient = DioApiClient.getInstance();
  @override
  Future<ApiResponseData> fecthUser() async {
    try {
      var response = await apiClient?.get('user/me');
      return ApiResponseData(
        statusCode: response?.statusCode,
        body: response?.data,
      );
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
