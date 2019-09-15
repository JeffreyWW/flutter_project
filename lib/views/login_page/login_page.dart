import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/application.dart';
import 'package:flutter_project/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _header(context),
          Padding(
            padding: const EdgeInsets.fromLTRB(55, 30, 55, 0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Padding(
                    ///默认是有边距的,这里可以设置
                    padding: const EdgeInsets.only(right: 33),
                    child: Icon(Icons.phone),
                  ),
                  hintText: "请输入手机号",
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 0.5))),
            ),
          )
        ],
      ),
    );
  }

  Stack _header(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: ScreenUtil().width,
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage('assets/bg_login_header.png'),
          ),
        ),
        SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.centerLeft,
                  height: ScreenUtil().setHeight(44),
                  child: FlatButton(
                    onPressed: () {
                      Application.router.pop(context);
                    },
                    child: Text(
                      '取消',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image(
                        image: AssetImage("assets/logo.png"),
                        height: 24.5,
                        width: 24.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text("北银消费金融",
                        style: TextStyle(
                            fontSize: 24, color: HexColor("#FFFFFF"))),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget phoneRow() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 43, 0),
      child: Row(
        children: <Widget>[
//          Text('手机号'),
          Expanded(
            flex: 1,
            child: TextField(
              keyboardType: TextInputType.phone,
              maxLength: 11,
              decoration: InputDecoration(
                  hintText: "请输入手机号",
                  border: InputBorder.none,
                  counterText: ""),
            ),
          )
        ],
      ),
    );
  }

  Widget line() {
    return Divider(
      height: 1,
      color: HexColor("#E6E6E6"),
      indent: 16,
      endIndent: 16,
    );
  }

  Widget codeRow() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 43, 0),
      child: Row(
        children: <Widget>[
//          Text('验证码'),
          Expanded(
//            flex: 1,
            child: Container(
              child: TextField(
//              keyboardType: TextInputType.phone,
//              maxLength: 11,
                decoration: InputDecoration(
//                  labelText: "fuck",
                    hasFloatingPlaceholder: false,
//                  isDense: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 33),
                      child: Align(
                        widthFactor: 1,
//                    width: 50,
//                    color: Colors.black,
                        child: Text(
                          'asdfasdfsafsafsafds',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),

//                  prefixText: "+86",
                    labelStyle: TextStyle(color: Colors.red),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 1)),
                    hintText: "请输入验证码",
                    enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.only(),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 0.5,
                        ))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
