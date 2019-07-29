import 'dart:async';

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
  int _count = 0;
  final _streamController = StreamController<int>();

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget steamTest = Center(
        child: StreamBuilder(
      stream: _streamController.stream,
      initialData: 0,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        return FlatButton(
          child: Text(_count.toString()),
          onPressed: () {
            ///初始值初始化,相当于默认value,add相当于重新赋值,只有流add才会触发控件刷新
            _streamController.sink.add(null);
            _count += 1;
          },
        );
      },
    ));
    return Scaffold(body: steamTest);
  }
}
