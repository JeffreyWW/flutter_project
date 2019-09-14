import 'package:dio/dio.dart';
import 'package:flutter_project/network/network_coder.dart';
import 'package:flutter_project/network/network_interceptors.dart';
import 'package:flutter_project/network/network_public_info.dart';
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

  ///请求转rx
  static Observable<Map<String, dynamic>> observable(String optionType,
          {Map<String, dynamic> bodyBody}) =>
      Observable.fromFuture(
          NetworkManager.request(optionType, bodyBody: bodyBody));

  ///请求,最后返回的是body.body
  static Future<Map<String, dynamic>> request(String optionType,
      {Map<String, dynamic> bodyBody}) {
    var path = '/' + optionType + '.do';
    return NetworkPublicInfo.updateInfo()
        .then((r) => _dio.post(path, data: bodyBody))
        .then((res) => Future.value(res.data));
  }
}
