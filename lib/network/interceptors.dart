import 'package:dio/dio.dart';

onRequest(RequestOptions options) {
  print("start request");
}

onResponse(Response response) {
  print(response);
}

onError(DioError e) {
  print("error");
}
