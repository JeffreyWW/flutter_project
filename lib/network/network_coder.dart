import 'package:dio/dio.dart';

class NetworkCoder {
  static List<int> requestEncoder(String request, RequestOptions options) {
    var data =   DefaultTransformer().transformRequest(options);
    return [1];
  }
}
