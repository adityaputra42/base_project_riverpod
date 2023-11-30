import 'package:base_project/config/network/network.dart';

abstract class AuthRepository {
  Future<BaseResponse> login({required dynamic body});

  Future<BaseResponse> register({required dynamic body});

  Future<void> logout();

  Future<BaseResponse> forgotPassword({required dynamic body});
}
