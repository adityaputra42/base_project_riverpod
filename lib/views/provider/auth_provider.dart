import 'package:base_project/config/network/network.dart';
import 'package:base_project/domain/controller/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider =
    Provider<AuthController>((ref) => AuthController());

final loginProvider =
    FutureProvider.autoDispose.family<BaseResponse, dynamic>((ref, body) async {
  var response = await ref.watch(authRepositoryProvider).login(body: body);
  return response;
});

final registerProvider =
    FutureProvider.autoDispose.family<BaseResponse, dynamic>((ref, body) async {
  var user = await ref.watch(authRepositoryProvider).register(body: body);
  return user;
});

final forgotPassworProvider = FutureProvider.autoDispose
    .family<BaseResponse, dynamic>((ref, body) async =>
        await ref.watch(authRepositoryProvider).forgotPassword(body: body));

final logoutProvider = FutureProvider.autoDispose(
    (ref) => ref.watch(authRepositoryProvider).logout());


// class Auth