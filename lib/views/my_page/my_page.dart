import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_project/network/index.dart';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _MyPageState();
  }
}

class _MyPageState extends State with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reset();
        controller.forward();
      }
    });
//    controller.forward();
  }

  Widget getRotationTransitionWidget() {
    return RotationTransition(
      turns: controller,
      alignment: Alignment.center,
      child: Text("aaaa"),
    );
  }

  Widget sim() {
    return SimpleDialog(
      children: <Widget>[],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FlatButton(
        child: Text("clicMe"),
        onPressed: () {
          NetworkManager.post("/MC0011.do",
              data: {"userNo": "", "pageType": "00"});
        },
      )),
    );
  }
}
