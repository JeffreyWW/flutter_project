import 'package:dio/dio.dart';

class NetworkInterceptors {
  static onRequest(RequestOptions options) {
    print('start request');
  }

  static onResponse(Response response) {
    print("response is :$response");
  }

  static onError(DioError e) {
    print("request error: $e");
  }
}
