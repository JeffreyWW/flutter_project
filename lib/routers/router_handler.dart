import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_project/views/home.dart';

var homeHandler = Handler(
    type: HandlerType.route,
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new HomePage(
        text: "JeffJack",
      );
    });

var testHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print("进来了" + "$context");
  return new Center(
    child: Text("Jeff"),
  );
});
