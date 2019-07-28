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
      child: Text("J1"),
      onPressed: () {
//        print("push");


        Application.router.navigateTo(context, "test",transition: TransitionType.native);


//        Navigator.push(context,
//            MaterialPageRoute(builder: (BuildContext context) => Text("Jeff")));
//        Navigator.pushNamed(context, "test").then((value) {
//          print("动画结束");
//        });
      },
    ));
  }
}

class _Demo extends StatelessWidget {
  final name;

  const _Demo({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Text(name);
  }
}
