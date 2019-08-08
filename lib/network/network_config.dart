import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

///常规配置
class NetworkConfig {
  ///域名
  static const baseUrl = "https://www.baidu.com";

  ///是否加密
  static const isEncryptionEnabled = true;

  ///请求为json格式,默认
  static final contentType = ContentType.json;

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

  static get defaultOptions =>
      BaseOptions(baseUrl: baseUrl, contentType: contentType);
}
