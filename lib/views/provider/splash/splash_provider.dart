import 'package:base_project/config/config.dart';
import 'package:base_project/utils/util.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_provider.g.dart';

@riverpod
class NewUser extends _$NewUser {
  @override
  bool build() {
    return PrefHelper.instance.isFirstInstall;
  }
}

@riverpod
class CheckUser extends _$CheckUser {
  @override
  Future<bool> build() async {
    await Future.delayed(const Duration(seconds: 2));
    return false;
  }

  void changeLogin() {
    state = const AsyncData(true);
    ref.watch(appRouteProvider).goNamed('main');
  }
}
