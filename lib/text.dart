import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[text1()],);
  }
}

class CustomText extends Text {
  CustomText() : super("111",textDirection:TextDirection.ltr);
}

Text text1(){
  return Text("如果不是Material包裹,需要textDirection属性",textDirection: TextDirection.ltr,textAlign: TextAlign.left,style: TextStyle(color: Colors.red),);
}

//
//class CustomText extends Text {
//
//}

//class A {
//  String name;
//  A(this.name);
//
//}
//
//class B extends A {
//  B(String name) : super(name);
//
//} {


