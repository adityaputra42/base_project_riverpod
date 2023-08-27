import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  late final SharedPreferences _pref;

  static PrefHelper instance = PrefHelper();

  Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  Future<bool> setFirstInstall() async {
    return await _pref.setBool("firstInstall", false);
  }

  bool get isFirstInstall => _pref.getBool("firstInstall") ?? true;

  Future<bool> setCookie(String cookie) async {
    return await _pref.setString("cookie", cookie);
  }

  String? get cookie => _pref.getString("cookie");

  Future<bool> removeCookie() async {
    return await _pref.remove('cookie');
  }

  Future<bool> setToken(String token) async {
    return await _pref.setString("token", token);
  }

  String? get token => _pref.getString("token");

  Future<bool> removeToken() async {
    return await _pref.remove('token');
  }
}
