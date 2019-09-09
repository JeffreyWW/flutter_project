import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

///统一配置,主要是头部,请求时间等配置

///常规配置
class NetworkConfig {
  ///域名
  static const host = "http://103.238.145.134:20086/";
//  static const host = "http://www.dfasdfadfasdfaasdf.com/";

  ///api地址
  static const apiUrl = "/byapp/open-gate/api/";

  ///api分地址
  static const baseUrl = host + apiUrl;

  ///连接超时时间
  static const connectTimeout = 8000;

  ///响应超时时间
  static const receiveTimeout = 8000;

  ///是否加密
//  static const isEncryptionEnabled = true;

  ///请求为json格式,默认
  static final contentType = ContentType.json;

  ///自定义请求头,algrithm为支持的加密算法,就应该写死,支持了加上就是
  static get customHeader => {"X-Flame-Encrypt-Accept": "algrithm=0"};

  static get defaultOptions => BaseOptions(
          baseUrl: baseUrl,
          contentType: contentType,
          receiveTimeout: receiveTimeout,
          connectTimeout: connectTimeout)
      .merge(headers: customHeader);
}
