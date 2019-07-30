import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TestEvent {}

class TestState {}

///TestEvent:是Bloc的输入。它们通常是UI事件，例如按钮按下。Events被分发(dispatched)并且被转换为States,类似信号的输入
///TestState:是Bloc的输出。表示组件可以监听状态流 并根据给定状态重绘其自身的部分（BlocBuilder有关详细信息，请参阅参考资料）。类似信号的输出
class TestBloc extends Bloc<String, int> {
  @override
  // TODO: implement initialState
  int get initialState => null;

  ///只要UI层触发一个事件，就会调用 mapEventToState。
  ///mapEventToState 必须将该event转换为新state，并以UI层使用的Stream形式返回新状态
  @override
  Stream<int> mapEventToState(String event) async* {
    // TODO: implement mapEventToState
    yield currentState - 1;
//    return null;
  }

  @override

  ///transform是一个 在调用mapEventToState之前 可以重写以转换 Stream<Event> .
  ///这允许使用distinct() 和 debounce() 的操作,个人感觉有点想flapMap
  Stream<int> transform(Stream<String> events, Stream<int> next(String event)) {
    return super.transform(events, next);
  }

  @override
  void onTransition(Transition<String, int> transition) {}
}

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

  void clickTest() {
    final bloc = TestBloc();
    bloc.dispatch("Jeff");

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
          onPressed: clickTest,
        );
      },
    ));
    return Scaffold(body: steamTest);
  }
}
