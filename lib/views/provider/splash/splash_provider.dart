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

@Riverpod(keepAlive: true)
class CheckUser extends _$CheckUser {
  @override
  bool build() {
    bool isLogin = PrefHelper.instance.isLogin;
    return isLogin;
  }

  void changeLogin() async {
    state =true;
    await PrefHelper.instance.setLogin(true);
    ref.watch(appRouteProvider).goNamed('main');
  }
}
