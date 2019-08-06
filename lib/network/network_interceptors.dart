import 'package:dio/dio.dart';
///监听模块
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
