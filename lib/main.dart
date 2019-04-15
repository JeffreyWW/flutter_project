import 'dart:async';

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
          backgroundColor: Colors.red,
          centerTitle: true,
          title: new Text(
            '这是个导航',
            style: TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
          ),
        ),
        body: Column(
          children: <Widget>[TitleSection(), BtnSection()],
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        //整行元素的对齐方式，下面注释取消掉则星星会顶到头部
//        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /*Expanded放在行或者列的里面再包含的元素会填充整个行或者列的剩余空间*/
          Expanded(
            child: Column(
              /*crossAxisAlignment属性为行或者列的子元素对齐方式,默认是貌似是剧中*/
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text("这是一个title",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  margin: EdgeInsets.only(bottom: 5),
                ),
                Text("这里是文字描述，可以写很多的话，还可以换行来着，你信不信，反正我是信了，换行后需要看下右边的行元素如何布局的"),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red,
          ),
          Text("51"),
        ],
      ),
    );
  }
}

class BtnSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Column buildBtnColumn(IconData icon, String btnTitle) {
      return Column(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.red,
          ),
          Container(
              child: Text(
                btnTitle,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                    fontWeight: FontWeight.w400),
              ),
              margin: EdgeInsets.only(top: 8)),
        ],
      );
    }

    return Row(
      children: <Widget>[buildBtnColumn(Icons.call, "电话")],
    );
  }
}
