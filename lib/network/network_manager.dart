import 'package:dio/dio.dart';
import 'package:flutter_project/network/network_coder.dart';
import 'package:flutter_project/network/network_interceptors.dart';
import 'package:rxdart/rxdart.dart';

import 'network_config.dart';

class NetworkManager {
  static configure() async {
    await NetworkCoder.configure();
  }

  static final Dio _dio = Dio(NetworkConfig.defaultOptions.merge(
      requestEncoder: NetworkCoder.requestEncoder,
      responseDecoder: NetworkCoder.responseDecoder))
    ..interceptors.add(InterceptorsWrapper(
        onRequest: NetworkInterceptors.onRequest,
        onResponse: NetworkInterceptors.onResponse,
        onError: NetworkInterceptors.onError));

  static Future request(String optionType, {Map bodyBody}) {
    var path = '/' + optionType + '.do';
    return _dio.post(path, data: bodyBody);
  }

  ///请求依靠dio,但会转为Observable
  static Observable<Response<T>> get<T>(String path) {
    return Observable.fromFuture(_dio.get(path));
  }

  ///请求依靠dio,但会转为Observable
  static Observable<Response<T>> post<T>(String path, {data}) {
    return Observable.fromFuture(_dio.post(path, data: data));
  }
}
