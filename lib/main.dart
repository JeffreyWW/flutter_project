import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/routers/application.dart';
import 'package:flutter_project/views/index.dart';


void main() => runApp(JFApp());

///App只定义配置,以及整个App的路由,主题等,然后关联一个主页面,主页面相当于tvc
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
    return MaterialApp(
//      title: "我的",
      theme: ThemeData(

          ///文字主题
          textTheme: TextTheme(

              ///默认字体为body1
              body1: TextStyle(color: Colors.blue),
              body2: TextStyle(color: Colors.blue)),

          ///图标主题
          iconTheme: IconThemeData(color: Colors.red, opacity: 0.5, size: 50)),
      home: Scaffold(body: MainPage()),
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
