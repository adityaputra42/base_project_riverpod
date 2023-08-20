class ApiResponseData {
  int? statusCode;
  dynamic body;
  Map<String, String>? headers;

  ApiResponseData({
    this.statusCode,
    this.body,
    this.headers,
  });
}
