import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_project/repositoies/floor.dart';

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
        onPressed: ()  {

//          var res = await NetworkManager.request("MC0011",
//              bodyBody: {"userNo": "", "pageType": "00"});
//          print("res is ");
        FloorRepositories.getHomeFloor().listen((data){
          print("");

        });

//          NetworkManager.observable('MC0011',
//              bodyBody: {"userNo": "", "pageType": "00"}).listen((data){
//                print("object");
//                Floor floor = Floor.fromJsonMap(data);
//                print("object");
//
//          });

//          print(res);

//          NetworkManager.post("/MC0011.do",
//              data: {"userNo": "", "pageType": "00"}).listen((res) {
//            print(res.data["body"]["body"]);
//          }, onError: (e) {
//            print(e);
//          });
        },
      )),
    );
  }
}
