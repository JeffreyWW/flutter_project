import 'package:dio/dio.dart';
import 'package:flutter_project/network/network_interceptors.dart';
import 'package:rxdart/rxdart.dart';

import 'network_config.dart';

class NetworkManager {
  static final Dio _dio = Dio(NetworkConfig.defaultOptions)
    ..interceptors.add(InterceptorsWrapper(
        onRequest: NetworkInterceptors.onRequest,
        onResponse: NetworkInterceptors.onResponse,
        onError: NetworkInterceptors.onError));

  ///请求依靠dio,但会转为Observable
  static Observable<Response<T>> get<T>(String path) {
    return Observable.fromFuture(_dio.get(path));
  }

  ///请求依靠dio,但会转为Observable
  static Observable<Response<T>> post<T>(String path) {
    return Observable.fromFuture(_dio.post(path));
  }
}
