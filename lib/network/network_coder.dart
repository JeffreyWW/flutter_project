import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/services.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:rxdart/rxdart.dart';

class NetworkCoder {
  static String _publicKey;

  static Observable prepared = Observable.just(_publicKey.length>0);


  ///RSA证书
  static const RSA_CER = "-----BEGIN PUBLIC KEY-----"
      "MIICOzCCAaSgAwIBAgIEUDGSyDANBgkqhkiG9w0BAQUFADBiMQswCQYDVQQGEwJjbjEPMA0GA1UECBMGaHpiYW5rMQ8wDQYDVQQHEwZoemJhbmsxDzANBgNVBAoTBmh6YmFuazEPMA0GA1UECxMGaHpiYW5rMQ8wDQYDVQQDEwZoemJhbmswHhcNMTIwODIwMDEyODQwWhcNMTIxMTE4MDEyODQwWjBiMQswCQYDVQQGEwJjbjEPMA0GA1UECBMGaHpiYW5rMQ8wDQYDVQQHEwZoemJhbmsxDzANBgNVBAoTBmh6YmFuazEPMA0GA1UECxMGaHpiYW5rMQ8wDQYDVQQDEwZoemJhbmswgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAItFu7i17MUjaOf7aiSnJB3CbFu57IaUBSNZ/Tr1vSetgJn7Bqdg2RviGLB1x8/ckR2NUOwl4qSLxGpYBVXui/ALYJ3F1VhZ4kKWpwFYaCVqWwUgXwQ5F8hJuNkUllorJpwzX6MXw3et4dbVU5dNHMkTMh0gt8s0zqQGqNxDPi1PAgMBAAEwDQYJKoZIhvcNAQEFBQADgYEANBMkpa5B2kAUHFnjmhWYlfmGUOUQO8GfJuk0VtgFHFTzDQ0aQvwXlE8xhdZ5ANFyrR779wLgE+12EJXbcT1ASpkuoTm6u5QkD49lKwAmiUVYPWRuhB3XF5ugsDuEAnL6/JfCo4gdLRPCzKxrPFHEoYkpetV7TrB9e0l/fWyi2Rw="
      "-----END PUBLIC KEY-----";

  ///根据证书生成的公钥后实例化的加密器
//  static final _rsaEncrypter =
//      Encrypter(RSA(publicKey: RSAKeyParser().parse(RSA_CER)));

  ///AES的偏移
  static const _AES_IV = "1269571569321021";

  printDailyNewsDigest() async {
//    String news = await gatherNewsReports();
//    print(news);
  }

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
    ///本地数据包含头部和body,body其实是我们需要参数
    var localData = {"header": _dataHeader, "body": options.data};

    ///随机生成16位的aes的key
    final aesKey =
        List.generate(16, (index) => Random().nextInt(9).toString()).join();

    ///这个key需要给到后台的,但是是需要经过RSA加密
    print("222");
//     String string = await rootBundle.loadString('keys/rsa.pem');

    var p = RSAKeyParser().parse(RSA_CER);

    print(p);

    var aaa = Encrypter(RSA(publicKey: RSAKeyParser().parse(RSA_CER)))
        .encrypt("222222")
        .base64;
    print("3333");

    print(aaa);

//    final encryptKey = _rsaEncrypter.encrypt(aesKey).base64;

    ///最后data需要经过aes加密,aes加密目前没有问题,iv则是固定值,最后转成base64字符串
    var encryptVal = AES(Key(utf8.encode(aesKey)), mode: AESMode.cbc)
        .encrypt(utf8.encode(json.encode(localData)),
            iv: IV(utf8.encode(_AES_IV)))
        .base64;

//    var finalBody = {"encryptKey": encryptKey, "encryptVal": encryptVal};

    ///options.data有自己的body和header,作为给后台的数据
    ///通过图片解密方式给一个secureKey到后台,后台可以解出来
    ///获取0到9之间随机数,一共15次,作为aec加密的key
    ///证书的base64文件FMCGatewaySessionSecurity,通过它可以ras算法生成公钥
    ///拿着公钥将随机数也就是aes的key加密,也就是encryptKey,而之前的options.data则通过aes的key和iv加密作为encryptVal
    ///最后实际上请求的body有3个键,一个签名,一个aes加密的值,这个值其实解密完也还有header和body,还有一个aes的key,是通过rsa加密过的
    /// 请求的body里面又套了一层,分别是header,body,
    ///加密则给签名和两个值,不加密直接给data

    return [1];
  }
}
