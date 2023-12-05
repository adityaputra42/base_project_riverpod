import 'package:base_project/utils/util.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:base_project/domain/controller/auth_controller.dart';

import '../../../config/config.dart';

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
  // await ref.watch(authRepositoryProvider).logout();
  await Future.delayed(const Duration(seconds: 1));
  PrefHelper.instance.setLogin(false);
  ref.read(appRouteProvider).goNamed('login');
  return;
}
