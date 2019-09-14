import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/application.dart';
import 'package:flutter_project/network/index.dart';
import 'package:flutter_project/views/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:native_info/native_info.dart';

void main() async {
  await NetworkManager.configure();
  await NativeInfo.configure();
  runApp(BlocProvider(
    builder: (context) => Application.bloc,
    child: JFApp(),
  ));
}

request() async {
  await Future.delayed(Duration(seconds: 1));
  return "ok!";
}

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
        canvasColor: Colors.white,
        appBarTheme: AppBarTheme(
            elevation: 0,
            color: Colors.white,
            brightness: Brightness.light,
            iconTheme: IconThemeData(color: Colors.black),
            textTheme: TextTheme(
                title: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenUtil().setWidth(34),
                    fontWeight: FontWeight.w500))),

        ///文字主题
        textTheme: TextTheme(
            title: TextStyle(color: Colors.white, fontSize: 24),

            ///默认字体为body1
            body1: TextStyle(color: Colors.black),
            body2: TextStyle(color: Colors.blue)),
      ),
      home: Scaffold(body: IndexPage()),
      onGenerateRoute: Application.router.generator,
    );
  }
}
