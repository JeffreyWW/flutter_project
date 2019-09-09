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

  static Observable<Map<String, dynamic>> observable(String optionType,
          {Map<String, dynamic> bodyBody}) =>
      Observable.fromFuture(
          NetworkManager.request(optionType, bodyBody: bodyBody));

  static Future<Map<String, dynamic>> request(String optionType, {Map<String, dynamic> bodyBody}) {
    var path = '/' + optionType + '.do';
    return _dio.post(path, data: bodyBody).then((res) {
      return Future.value(res.data["body"]["body"]);
    });
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
