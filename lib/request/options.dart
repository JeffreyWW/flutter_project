import 'dart:io';

import 'package:dio/dio.dart';

///网络基础配置
BaseOptions defaultOptions() {
  const baseUrl = "https://www.baidu.com";
  const connectTimeout = 1000;
  ContentType contentType = ContentType("2", "2");

  const ResponseType responseType = ResponseType.json;

  return BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: connectTimeout,
  );
}

const ddd = "";


