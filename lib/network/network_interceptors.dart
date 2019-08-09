import 'package:dio/dio.dart';

///监听模块,这里可以转换参数的传递
class NetworkInterceptors {
  static onRequest(RequestOptions options) {
    print("请求参数:");
    print(options.data);
  }

  static onResponse(Response response) {
    print("response is :$response");
  }

  static onError(DioError e) {
    print("服务器都没返回");

//    print("request error: $e");
  }

  static get customHeader => {
        "appVersion": "2.1.4",
        "netWorkTypse": "WIFI",
        "ipAddress": "fe80::9e:fe6b:15da:a1ca",
        "mobileType": "iPhoneSimulator",
        "deviceId": "4A9C4BFC7513AD9D7EE0C27E93F951E1",
        "sysVersion": "12.2",
        "resolution": "1242*2208",
        "platform": "iPhone",
        "channel": "10001003",
        "locationInfo": {},
        "iCIFID": "ynet",
        "mp_sId": "ynet",
        "userId": "",
        "device_id": "ynet",
        "fingerprint": "",
        "channelNo": "1",
      };
}
