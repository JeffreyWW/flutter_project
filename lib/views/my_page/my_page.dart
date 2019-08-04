import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyPageState();
  }
}

class _MyPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text("clickMe"),
          onPressed: () {
            showDialog<void>(
              context: context,
              barrierDismissible: true,
              // false = user must tap button, true = tap outside dialog
              builder: (BuildContext dialogContext) {
                return SimpleDialog(
                  contentPadding: EdgeInsets.all(0),
                  children: <Widget>[
                    Container(color: Colors.red, child: Text("Jeff"))
                  ],
                );
              },
            );
            ;
          },
        ),
      ),
    );
  }
}
