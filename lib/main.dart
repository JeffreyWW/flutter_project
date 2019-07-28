import 'dart:ui' as prefix0;

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/routers/application.dart';
import 'package:flutter_project/routers/routes.dart';
import 'package:flutter_project/views/home.dart';


void main() => runApp(JFApp());


class JFApp extends StatefulWidget {
  JFApp() {
    ///所有配置用Application来配,内部则各自组建去自己配置
    Application.configure();

  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _JFAppState();
  }
}

class _JFAppState extends State<JFApp> {
  @override
  Widget build(BuildContext context) {
    print("有路由:"+"$Application.router");

    return MaterialApp(
//      title: "我的",
      theme: ThemeData(

          ///文字主题
          textTheme: TextTheme(

              ///默认字体为body1
              body1: TextStyle(color: Colors.red),
              body2: TextStyle(color: Colors.blue)),

          ///图标主题
          iconTheme: IconThemeData(color: Colors.red, opacity: 0.5, size: 50)),
      home: Scaffold(body: HomePage()),
//      routes: <String, WidgetBuilder>{"test": (c) => Text("ssssss")},
      onGenerateRoute: Application.router.generator,
//      navigatorObservers: <NavigatorObserver>[Analytics.observer],
//
      ///显示网格线,默认false
//      debugShowMaterialGrid: false,

      ///右上角的debug标志,默认true
//      debugShowCheckedModeBanner: false,
    );
  }
}
