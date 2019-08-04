import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/application.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State {
  void clickTest() {

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: () {
            Application.router.navigateTo(context, "/blocTest",
                transition: TransitionType.native);
          },
          child: Text("blocTest"),
        ),
      ),
    );
  }
}
