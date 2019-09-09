import 'package:dio/dio.dart';

class NetworkInterceptors {
  static onRequest(RequestOptions options) {}

  static onResponse(Response response) {
    print("进来了");
    print("进来了");
    print("进来了");
    print("进来了");

  }

  static onError(DioError error) {
    return CustomError();
  }
}

class CustomError implements Exception {}
