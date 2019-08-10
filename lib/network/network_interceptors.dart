import 'package:dio/dio.dart';

class NetworkInterceptors {
  static onRequest(RequestOptions options) {}

  static onResponse(Response response) {}

  static onError(DioError error) {
    return CustomError();
  }
}

class CustomError implements Exception {}
