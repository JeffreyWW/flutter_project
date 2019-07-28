import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/text.dart';

///container实际上可以作
class TestMaterialApp extends MaterialApp {
  TestMaterialApp()
      : super(
            color: Colors.white,
            home: Container(
              child: Text(
                "11",
                style: TextStyle(decoration: TextDecoration.none),
                textAlign: TextAlign.right,
              ),
            ));
}
