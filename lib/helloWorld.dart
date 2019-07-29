import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///本身是属于抽象类,build需要自己去实现
class HelloWorld extends StatelessWidget {
  ///build 方法返回一个Widget,但是内部可以看到它是用@protected修辞的,意思是只能子类调用
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "hellowWorld",
        textDirection: TextDirection.ltr,
      ),
    );
  }
}

