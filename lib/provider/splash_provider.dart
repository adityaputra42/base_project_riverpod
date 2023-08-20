import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IsNewUserNootifier extends StateNotifier<bool> {
  IsNewUserNootifier() : super(false);
  void checkFirstInstall() async {
    var pref = await SharedPreferences.getInstance();
    state = pref.getBool("firstInstall") ?? false;
  }
}
final isNewUseProvider = StateNotifierProvider<IsNewUserNootifier, bool>(
    (ref) => IsNewUserNootifier());

final isLoginProvider = StateProvider<bool>((ref) => false);
