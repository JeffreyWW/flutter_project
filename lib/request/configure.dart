import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

const baseUrl = "https:www.baidu.com";

config({@required Dio dio}) {
  ///基础url
  dio.options.baseUrl = baseUrl;

  ///超时时间
  dio.interceptors.add(InterceptorsWrapper(
      onRequest: onRequest, onError: onError, onResponse: onResponse));
}

onRequest(RequestOptions options) {}

onError(DioError e) {}

onResponse(Response response) {
  print(response);
}
