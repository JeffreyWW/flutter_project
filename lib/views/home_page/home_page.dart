import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/routers/application.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State {
  void clickTest() {
    var list = [];

    for (int i = 0; i < 1000; i++) {
      list.add(i);
    }

    Future getValue() {
      return Future.error(Error());

    }

    getValue().then((v) => print(v)).catchError((e) => print(e));

    print("结束");

//    var httpClient = new HttpClient();
//    var uri = Uri.parse("https://www.baidu.com");
//    var uri = Uri.https("www.baidu.com", null);
//    var request = httpClient.getUrl(uri);

//    var request = httpClient.getUrl();

    print("点我");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: clickTest,
          child: Text("点我"),
        ),
      ),
    );
  }
}
