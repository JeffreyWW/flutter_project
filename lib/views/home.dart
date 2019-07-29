import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/routers/application.dart';

class HomePage extends StatefulWidget {
  final String text;

  const HomePage({Key key, this.text}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: FlatButton(
      child: Text("J1",style: Theme.of(context).textTheme.body1,),
      onPressed: () {
        Application.router
            .navigateTo(context, "test", transition: TransitionType.native);
      },
    ));
  }
}
