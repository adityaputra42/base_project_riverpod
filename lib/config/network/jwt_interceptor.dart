import 'package:base_project/utils/util.dart';
import 'package:dio/dio.dart';

class JwtInterceptor extends Interceptor {
  JwtInterceptor._privateConstructor();
  static final JwtInterceptor _instance = JwtInterceptor._privateConstructor();
  static get instance => _instance;

  String? _cookie;
  String? _token;

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode! >= 200 && response.statusCode! <= 400) {
      if (response.headers.map['set-cookie'] != null) {
        saveCookie(response.headers.map['set-cookie']![0]);
      }
      if (response.data.contains('authToken')) {
        saveToken(response.data['authToken']);
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
    options.headers['x-csrf-token'] = _token;

    return super.onRequest(options, handler);
  }

  Future init() async {
    _cookie = PrefHelper.instance.cookie;
    _token = PrefHelper.instance.token;
  }

  void saveCookie(String newCookie) async {
    if (_cookie != newCookie) {
      _cookie = newCookie;
      PrefHelper.instance.setCookie(_cookie!);
    }
  }

  void clearCookie() async {
    _cookie = null;
    PrefHelper.instance.removeCookie();
  }

  void saveToken(String token) async {
    if (_token != token) {
      _token = token;
      PrefHelper.instance.setToken(_token!);
    }
  }

  void clearToken() async {
    _token = null;
    PrefHelper.instance.removeToken();
  }
}
