import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_project/repositoies/floor.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

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
    bool _save = true;

    return Scaffold(
      body: ModalProgressHUD(
        child: Center(
            child: FlatButton(
          child: Text("clicMe"),
          onPressed: () {
            _save = false;
            FloorRepositories.getHomeFloor().listen((data) {
              print("");
            });
          },
        )),
        inAsyncCall: _save,
        opacity: 0.1,
//        color: Colors.blue,
//        offset: Offset(2, 3),
        dismissible: true,
        progressIndicator: Container(
          color: Colors.black,
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.red))),
      ),
    );
  }
}
