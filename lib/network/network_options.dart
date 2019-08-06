import 'package:dio/dio.dart';



BaseOptions defaultOptions() {
  return BaseOptions(baseUrl: "https://www.baidu.com",responseDecoder: (
      List<int> responseBytes, RequestOptions options, ResponseBody responseBody){
    return "";
  });
}
