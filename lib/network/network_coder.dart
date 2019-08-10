import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
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
  static final IV _aesIV = IV(utf8.encode("1269571569321021"));

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

  static List<int> requestEncoder(String request, RequestOptions options) {
    ///请求时间
    var requestTime = DateTime.now().millisecondsSinceEpoch.toString();

    ///httpBody里面的header字段
    var httpBodyHeader = {"channel": "AT", "requestTime": requestTime};

    ///本地数据包含头部和body,body其实是我们需要参数
    var localData = {"header": _dataHeader, "body": options.data};

    ///数据的jsonString+channel+requestTime,然后md5转小写,最后base64
    var sign = Encrypted.fromUtf8(md5
            .convert(utf8.encode(json.encode(localData) + "AT" + requestTime))
            .toString()
            .toLowerCase())
        .base64;

    ///随机生成16位的aes的key
    var aesKey =
        List.generate(16, (index) => Random().nextInt(9).toString()).join();

    ///把key通过rsa加密并转成base64给后台,后台会有私有去解密得到aes的key
    var encryptKey = _rsaEncrypter.encrypt(aesKey).base64;

    ///最后本地数据需要经过aes加密,aes加密目前没有问题,iv则是固定值,最后转成base64字符串
    var encryptVal = AES(Key(utf8.encode(aesKey)), mode: AESMode.cbc)
        .encrypt(utf8.encode(json.encode(localData)), iv: _aesIV)
        .base64;
    var httpBodyBody = {
      "sign": sign,
      "encryptKey": encryptKey,
      "encryptVal": encryptVal
    };
    var httpBody = {"header": httpBodyHeader, "body": httpBodyBody};
    return JsonUtf8Encoder().convert(httpBody);
  }

  static String responseDecoder(List<int> responseBytes, RequestOptions options,
      ResponseBody responseBody) {
    ///返回的json
    var gateWayResponse = json.decode(utf8.decode(responseBytes));

    ///网关的header,包含errorCode和errorMsg
    var gateWayHeader = gateWayResponse["header"];
    var gateWayBody = gateWayResponse["body"];

    ///返回的body里面去出X-Flame-Encrypt字段,用;隔开取后段,再去key=后端,拿到base64的一个字符串,还原,得到加密后的aesKey
    var aesEndryptedKey = utf8.decode(Encrypted.fromBase64(
            (gateWayBody["X-Flame-Encrypt"] as String)
                .split(";")
                .last
                .split("key=")
                .last)
        .bytes);
    var aesKeyList = [];

    ///缝3不要,算是个简单解密,拿到aes的key
    for (int i = 0; i < aesEndryptedKey.length; i++) {
      if (i > 0 && i % 3 == 0) {
      } else {
        aesKeyList.add(aesEndryptedKey[i]);
      }
    }

    ///解密,拿到encryptVal字段,但是后台还会返回header和body字段,header里面会有errorCode和errorMsg,其它的都是之前给过的信息,算是业务层的错误
    var encryptVal = json.decode(utf8.decode(
        AES(Key(utf8.encode(aesKeyList.join())), mode: AESMode.cbc).decrypt(
            Encrypted.fromBase64(gateWayBody["encryptVal"]),
            iv: _aesIV)));
    var finalResponse = {
      ///网关头部,直接返回的
      "header": gateWayHeader,

      ///数据,里面也有header和body,后台反的
      "body": encryptVal,
    };

    return json.encode(finalResponse);
  }
}

class CustomError implements Exception {}
