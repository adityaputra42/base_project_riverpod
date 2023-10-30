import 'package:dio/dio.dart';

class ApiException {
  List<String> getExceptionMessage(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.badResponse:
        return [
          "Bad Response Error",
          "Check Api url or parameters are invalid"
        ];
      case DioExceptionType.connectionError:
        return [
          "Connection Error",
          "Check Network Connectivity",
        ];
      case DioExceptionType.connectionTimeout:
        return [
          "Connection Timeout",
          "Check Network Connectivity!",
        ];
      case DioExceptionType.cancel:
        return [
          "Request Canceled",
          "Check API url or parameter invalid",
        ];

      case DioExceptionType.receiveTimeout:
        return [
          "Receive Timeout",
          "Check API url, Network Connectivity or parameter invalid",
        ];

      default:
        return [
          "Unknow Error",
          "Check API url or parameter invalid",
        ];
    }
  }
}
