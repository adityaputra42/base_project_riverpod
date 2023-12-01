import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:base_project/config/network/network.dart';
import 'package:base_project/domain/controller/auth_controller.dart';

part 'auth_provider.g.dart';

@riverpod
Future<BaseResponse> login(LoginRef ref, body) async {
  var response = await ref.watch(authRepositoryProvider).login(body: body);

  return Future.value(response);
}

@riverpod
Future<BaseResponse> register(RegisterRef ref, body) async {
  var response = await ref.watch(authRepositoryProvider).register(body: body);

  return Future.value(response);
}

@riverpod
Future<BaseResponse?> forgotPassword(ForgotPasswordRef ref, body) async {
  var response =
      await ref.watch(authRepositoryProvider).forgotPassword(body: body);

  return Future.value(response);
}

@riverpod
Future<void> logout(LogoutRef ref) async {
  await ref.watch(authRepositoryProvider).logout();

  return;
}
