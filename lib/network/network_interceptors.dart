import 'package:dio/dio.dart';

class NetworkInterceptors {
  static onRequest(RequestOptions options) {}

  ///结果转换,正常会拿到head和body,body里面又有header和body
  static onResponse(Response response) {
    var gateWayHeader = response.data["header"];
    var gateWayErrorCode = gateWayHeader["errorCode"];
    var gateWayErrorMsg = gateWayHeader["errorMsg"];

    ///header的code不是0,直接报错网关错误码和信息
    if (gateWayErrorCode != "0") {
      throw BOBError(BOBErrorType.gateWay, gateWayErrorCode, gateWayErrorMsg);
    }

    var gateWayBody = response.data["body"];
    var apiHeader = gateWayBody["header"];
    var apiErrorCode = apiHeader["errorCode"];
    var apiErrorMsg = apiHeader["errorMsg"];

    ///里层的header的code不是0,直接报api错误码和信息
    if (apiErrorCode != "0") {
      throw BOBError(BOBErrorType.api, apiErrorCode, apiErrorMsg);
    }

    ///都没错,直接把数据抛出去
    var apiBody = gateWayBody["body"];

    return apiBody;
  }

  static onError(DioError error) {
    var errorValue = error.error;
    if (errorValue is BOBError) {
      switch (errorValue.errorType) {
        case BOBErrorType.api:
          print("api错误");
          break;
        case BOBErrorType.gateWay:
          print("网关错误");
          break;
      }
    }
  }
}

enum BOBErrorType { api, gateWay }

class BOBError implements Exception {
  final BOBErrorType errorType;
  final String errorCode;
  final String errorMessage;

  BOBError(this.errorType, this.errorCode, this.errorMessage);
}
