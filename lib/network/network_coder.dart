import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/services.dart';

class NetworkCoder {
  ///rsa加密器
  static Encrypter _rsaEncrypter;

  ///配置,会先读取pem信息,然后生成rsa加密器
  static configure() async {
    var pem = await rootBundle.loadString('keys/rsa.pem');
    var publicKey = RSAKeyParser().parse(pem);
    _rsaEncrypter = Encrypter(RSA(publicKey: publicKey));
  }

  ///AES的偏移
  static const _AES_IV = "1269571569321021";

  ///数据header
  static get _dataHeader => {
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

  ///http固定头部
  static get _httpBodyHeader => {
        "channel": "AT",
        "requestTime": DateTime.now().millisecondsSinceEpoch.toString()
      };

  static List<int> requestEncoder(String request, RequestOptions options) {
    ///本地数据包含头部和body,body其实是我们需要参数
    var localData = {"header": _dataHeader, "body": options.data};

    ///随机生成16位的aes的key
    var aesKey =
        List.generate(16, (index) => Random().nextInt(9).toString()).join();

    ///把key通过rsa加密并转成base64给后台,后台会有私有去解密得到aes的key
    var encryptKey = _rsaEncrypter.encrypt(aesKey).base64;

    ///最后本地数据需要经过aes加密,aes加密目前没有问题,iv则是固定值,最后转成base64字符串
    var encryptVal = AES(Key(utf8.encode(aesKey)), mode: AESMode.cbc)
        .encrypt(utf8.encode(json.encode(localData)),
            iv: IV(utf8.encode(_AES_IV)))
        .base64;
    var httpBodyBody = {"encryptKey": encryptKey, "encryptVal": encryptVal};
    var httpBody = {"header": _httpBodyHeader, "body": httpBodyBody};
    print("body:");

    print(httpBody);

    return JsonUtf8Encoder().convert(httpBody);
  }
}
