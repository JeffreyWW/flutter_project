import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

/*框架强制app会铺满屏幕,即第一个Widget会铺满屏幕*/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Container(
//        padding: EdgeInsets.all(100),
        margin: EdgeInsets.all(100),
        color: Colors.red,
        alignment: Alignment(1,1),
        child: Text("Jeffrey", textDirection: TextDirection.rtl),
      ),
    );

//    return Text('a 发',
//        textDirection: TextDirection.rtl,
//        style: new TextStyle(fontSize: 40.0, color: Colors.red));
  }
}
