import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

/*框架强制app会铺满屏幕,即第一个Widget会铺满屏幕*/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutt12er'),
        ),
        body: Row(
          children: <Widget>[
            new Text('Hello World'),
          ],
        ),
      ),
    );
  }
}
