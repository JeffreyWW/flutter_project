import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/views/index.dart';
import 'package:flutter_project/views/login_page/login_page.dart';
import 'package:flutter_project/views/test/bloc_test.dart';

var homeHandler = Handler(
    type: HandlerType.route,
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new IndexPage(
        text: "JeffJack",
      );
    });

var loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
        LoginPage());

var blocTestHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return BlocPage();
});
