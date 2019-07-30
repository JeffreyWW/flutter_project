import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///函数返回流,一旦监听,里面的值就发送,yield相当于发送
Stream<int> asyncTest() async* {
  print("开始");
  for (int i = 0; i < 5; i++) {
    yield 3;
    print(i);
  }
  yield 100;
  print("done");
}

///Bloc整个流程:初始化Bloc,调用dispatch方法传入event,即输入,它会响应mapEventToState方法
///并调用在响应流后执行onTransition方法

///TestEvent:是Bloc的输入。它们通常是UI事件，例如按钮按下。Events被分发(dispatched)并且被转换为States,类似信号的输入
///TestState:是Bloc的输出。表示组件可以监听状态流 并根据给定状态重绘其自身的部分（BlocBuilder有关详细信息，请参阅参考资料）。类似信号的输出
class TestBloc extends Bloc<String, int> {
  @override
  // TODO: implement initialState
  int get initialState => 1;

  ///只要UI层触发一个事件，就会调用 mapEventToState。
  ///mapEventToState 必须将该event转换为新state，并以UI层使用的Stream形式返回新状态
  @override
  Stream<int> mapEventToState(String event) async* {
    print("进来了1");
    yield currentState + 1;
    print("进来了2");
    yield currentState + 1;
    print("done");

  }

  @override

  ///transform是一个 在调用mapEventToState之前 可以重写以转换 Stream<Event> .
  ///这允许使用distinct() 和 debounce() 的操作,个人感觉有点想flapMap
  Stream<int> transform(Stream<String> events, Stream<int> next(String event)) {
    print("转换");
    return super.transform(events, next);
  }

  ///onTransition 是一个 每次 transform 发生时都可以重写以进行处理 的方法。
  ///调度新event 并调用mapEventToState时发生transition。
  ///onTransition 在更新 bloc 状态之前 被调用。
  ///这是添加特定于块的日志记录/分析的好地方
  @override
  void onTransition(Transition<String, int> transition) {
    print(transition);
  }
}

class BlocPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BlocPageState();
  }
}

class _BlocPageState extends State {
  final bloc = TestBloc();

  int _count = 0;
  final _streamController = StreamController<int>();

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  void clickTest() {
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
