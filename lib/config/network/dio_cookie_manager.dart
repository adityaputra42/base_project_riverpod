import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioCookieManager extends Interceptor {
  DioCookieManager._privateConstructor();
  static final DioCookieManager _instance =
      DioCookieManager._privateConstructor();
  static get instance => _instance;

  String? _cookie;
  String? csrfToken;

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode! >= 200 && response.statusCode! <= 400) {
      if (response.headers.map['set-cookie'] != null) {
        _saveCookie(response.headers.map['set-cookie']![0]);
      }
    } else {
      clearCookie();
      clearToken();
    }
    super.onResponse(response, handler);
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.headers['cookie'] = _cookie;
    options.headers['x-csrf-token'] = csrfToken;

    return super.onRequest(options, handler);
  }

  Future initCookie() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _cookie = prefs.getString('cookie');
  }

  void _saveCookie(String newCookie) async {
    if (_cookie != newCookie) {
      _cookie = newCookie;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('cookie', _cookie!);
    }
  }

  void clearCookie() async {
    _cookie = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('cookie');
  }

  void getToken(String token) async {
    if (csrfToken != token) {
      csrfToken = token;
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('token', csrfToken!);
    }
  }

  void clearToken() async {
    _cookie = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('cookie');
  }
}
