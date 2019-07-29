import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BlocPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BlocPageState();
  }
}

class _BlocPageState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Text("BlocTest"),
      ),
    );
  }
}
