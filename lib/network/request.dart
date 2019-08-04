import 'package:dio/dio.dart';
import 'package:flutter_project/network/index.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_project/network/interceptors.dart';

class Request {
  ///使用默认配置
  static BaseOptions options = defaultOptions();

  ///添加全局监听函数
  static Dio dio = Dio(options)
    ..interceptors.add(InterceptorsWrapper(
        onRequest: onRequest, onResponse: onResponse, onError: onError));

  ///请求依靠dio,但会转为Observable
  static Observable<Response<T>> get<T>(String path) {
    return Observable.fromFuture(dio.get(path));
  }

  ///请求依靠dio,但会转为Observable
  static Observable<Response<T>> post<T>(String path) {
    return Observable.fromFuture(dio.post(path));
  }
}
