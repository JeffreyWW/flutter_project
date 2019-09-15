import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/application.dart';
import 'package:flutter_project/component/state_icon_button.dart';
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
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          children: <Widget>[
            _header(context),
            Padding(
              padding: const EdgeInsets.fromLTRB(55, 30, 55, 0),
              child: _phoneTextField(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(55, 11, 55, 0),
              child: _codeTextField(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 55),
                    child: Container(child: _btnSelect(context)),
                  ),
                  Text('fuckfuckfuckfuck')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: _btnLogin(context),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: _otherButtons(context),
            )
          ],
        ),
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

  Widget _phoneTextField() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
//            contentPadding:EdgeInsets.only(top: 55),
            prefixIcon: Padding(
              ///默认是有边距的,这里可以设置
              padding: const EdgeInsets.only(right: 33),
              child: Image(
                width: 27,
                height: 27,
                image: AssetImage("assets/login_phone.png"),
              ),
            ),
            hintText: "请输入手机号",
            enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: HexColor("#E6E6E6"), width: 0.5))),
      ),
    );
  }

  TextField _codeTextField() {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: Padding(
            ///默认是有边距的,这里可以设置
            padding: const EdgeInsets.only(right: 33),
            child: Image(
              width: 27,
              height: 27,
              image: AssetImage("assets/login_pwd.png"),
            ),
          ),
          hintText: "请输入密码",
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: HexColor("#E6E6E6"), width: 0.5))),
    );
  }

  Widget _btnSelect(BuildContext context) {
    return StateIconButton(
      iconSize: Size(22, 22),
      iconSet: {
        ButtonState.normal: Image(
//          fit: BoxFit.cover,
          image: AssetImage("assets/btn_agreement.png"),
        ),
        ButtonState.selected: Image(
          image: AssetImage("assets/btn_agreement_selected.png"),
        )
      },
      onPress: (ButtonState state) {
        switch (state) {
          case ButtonState.normal:
            return ButtonState.selected;
          case ButtonState.selected:
            return ButtonState.normal;
        }
        return ButtonState.normal;
      },
    );
  }

  Widget _btnLogin(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(480),
      height: ScreenUtil().setWidth(90),
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(ScreenUtil().setWidth(90))),
          gradient: LinearGradient(
              colors: [HexColor("#FF9B80"), HexColor("#FF0404")],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: FlatButton(
        child: Text(
          '登陆',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        onPressed: () {
          print("login");
        },
      ),
    );
  }

  Row _otherButtons(BuildContext context) {
    _verticalDivider() {
      return Container(
          height: ScreenUtil().setHeight(30),
          child: VerticalDivider(
            width: 1,
            color: HexColor("#E6E6E6"),
          ));
    }

    _singleButton(String clickName) {
      return FlatButton(
        onPressed: () {
          print("点击了" + "$clickName" + "按钮");
        },
        child: Text(clickName),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Expanded(
            flex: 1,
            child: _singleButton("立即注册"),
          ),
        ),
        _verticalDivider(),
        Expanded(
          child: _singleButton("更换手机号"),
        ),
        _verticalDivider(),
        Expanded(
          child: _singleButton("忘记密码"),
        ),
      ],
    );
  }
}
