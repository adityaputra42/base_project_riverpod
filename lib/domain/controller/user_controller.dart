import 'package:base_project/data/model/network/api_response_data.dart';
import 'package:base_project/domain/repository/repository.dart';
import 'package:dio/dio.dart';

import '../../config/config.dart';

class UserController implements UserRepository {
  final apiClient = DioApiClient.getApiService();
  // @override
  // Future<ApiResponseData> fecthUser() async {
  //   return apiClient.getCollectionData<ApiResponseData>(endpoint: "", converter: (Map<String, dynamic> responseBody) {  });
  // }
}
