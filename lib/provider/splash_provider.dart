import 'package:base_project/utils/util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IsNewUserNootifier extends StateNotifier<bool> {
  IsNewUserNootifier() : super(false);
  void checkFirstInstall() {
    state = PrefHelper.instance.isFirstInstall;
  }
}

final isNewUseProvider = StateNotifierProvider<IsNewUserNootifier, bool>(
    (ref) => IsNewUserNootifier());

final isLoginProvider = StateProvider<bool>((ref) => false);
