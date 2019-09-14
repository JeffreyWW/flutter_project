import 'dart:io';

import 'package:flutter_project/utils/native_info.dart';

class NetworkPublicInfo {
  static Map<String, dynamic> get info => _info;

  static Map<String, dynamic> _info;

  static  Future updateInfo() async {
    _info = {
      "appVersion": NativeInfo.packageInfo.version,
      "netWorkTypse": "WIFI",
      "ipAddress": "fe80::9e:fe6b:15da:a1ca",
      "mobileType": NativeInfo.deviceInfo.name,
      "deviceId": NativeInfo.deviceInfo.identifierForVendor,
      "sysVersion": NativeInfo.deviceInfo.systemVersion,
      "resolution": "1242*2208",
      "platform": Platform.isIOS ? "iPhone" : "Android",
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
}
