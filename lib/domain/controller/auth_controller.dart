import 'package:base_project/config/config.dart';
import 'package:base_project/domain/repository/repository.dart';

class AuthController implements AuthRepository {
  final apiClient = DioClient.instance;

  @override
  Future<BaseResponse> forgotPassword({required body}) async {
    try {
      var response = await apiClient.post('forgotPassword', data: body);
      return response;
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  @override
  Future<BaseResponse> login({required body}) async {
    try {
      var response = await apiClient.post('login', data: body);
      return response;
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  @override
  Future<void> logout() async {
    try {
      await apiClient.post('logout');
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  @override
  Future<BaseResponse> register({required body}) async {
    try {
      var response = await apiClient.post('register', data: body);
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
