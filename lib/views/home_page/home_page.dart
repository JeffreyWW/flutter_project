import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/blocs/food/bloc.dart';
import 'package:flutter_project/utils/color.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State {
  void clickTest() {}
  final FoodBloc _foodBloc = FoodBloc();
  var scrollController = ScrollController();
  var streamController = StreamController<double>();

  @override
  void initState() {
    super.initState();
    scrollController
        .addListener(() => streamController.sink.add(scrollController.offset));
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return new Scaffold(
        body: BlocBuilder(
            bloc: _foodBloc,
            builder: (BuildContext context, FoodState state) {
              return Stack(
                children: <Widget>[
                  ListView.builder(
                    controller: scrollController,
                    physics: AlwaysScrollableScrollPhysics(),

                    ///默认会把导航距离移除,为0则可以顶着头部了
                    padding: EdgeInsets.only(top: 0),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return _headerView(context);
                      }
                      if (index == 1) {
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 36,
                                width: 36,
                                child: Image.network(
                                    "http://103.238.145.134:20086/byapp/group1/M01/00/32/CqIBNV04P-aAM38UAAAIyQvawPI375.png"),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: _messageView(context),
                                ),
                              )
                            ],
                          ),
                        );
                      }

                      return Text('text');
                    },
                  ),
                  SafeArea(child: _navigationBar())
                ],
              );
            }));
  }

  ///导航,就包含俩按钮而已
  Widget _navigationBar() {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        height: 44,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: ImageIcon(
                AssetImage("assets/nav_listen.png"),
                color: Colors.white,
              ),
              onPressed: () {
                print("点击");
              },
            ),
            IconButton(
              icon: ImageIcon(
                AssetImage("assets/nav_message.png"),
                color: Colors.white,
              ),
              onPressed: () {
                print("点击2");
              },
            ),
          ],
        ));
  }

  ///卡片第一分区
  Row _cardFirstSection() {
    return Row(
      children: <Widget>[
        Container(
            alignment: Alignment(-0.3, 0),
            width: 58,
            height: 25,
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.fitHeight,
                    image: AssetImage("assets/bg_title.png"))),
            child: Text(
              'e点贷',
              style: TextStyle(color: Colors.white, fontSize: 14),
            )),
        Padding(
          padding: const EdgeInsets.only(left: 11),
          child: Text(
            '可用额度(元)',
            style: TextStyle(fontSize: 14, color: HexColor("#666666")),
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
              width: 100,
              height: 30,
              alignment: Alignment.centerRight,
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.red, width: 0.5),
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                onPressed: () {
                  print("1");
                },
                child: Text(
                  "去还款",
                  style: TextStyle(fontSize: 16, color: HexColor("#F23030")),
                ),
              )),
        ))
      ],
    );
  }

  ///卡片里的数字
  Widget _cardNumber() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 17),
        child: Text(
          '200,000,00',
          style: TextStyle(
              fontSize: 40,
              fontFamily: "DIN Alternate",
              color: HexColor("#333333")),
        ),
      ),
    );
  }

  ///卡片里最下面的描述元素
  Padding _cardDescriptionElements(String message, String imagePtah) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image(
              image: AssetImage(imagePtah),
            ),
          ),
          Text(
            message,
            style: TextStyle(fontSize: 12, color: HexColor("#666666")),
          ),
        ],
      ),
    );
  }

  ///描述集合
  Widget _cardDescriptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _cardDescriptionElements("秒级到账", "assets/icon_money.png"),
        _cardDescriptionElements("极速审批", "assets/icon_shak.png"),
      ],
    );
  }

  ///卡片里的分割线
  Widget _cardDivider() {
    return Divider(
      color: HexColor("#E6E6E6"),
      indent: 50,
      endIndent: 50,
    );
  }

  ///卡片
  Widget _card(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 31, 16, 0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 19),
              child: _cardFirstSection(),
            ),
            _cardNumber(),
            Padding(
                padding: const EdgeInsets.only(top: 15), child: _cardDivider()),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 21),
                child: _cardDescriptions(),
              ),
            )
          ],
        ),
//        color: Colors.blue,
      ),
    );
  }

  ///头部背景图
  StreamBuilder<double> _headImageView() {
    return StreamBuilder<double>(
      initialData: 0,
      stream: streamController.stream,
      builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
        var scale = 1.0;

        ///偏移距离
        var distance = -snapshot.data;

        ///实际高度
        var realHeight = 375.0 * 948.0 / 1125.0;

        ///放大后应该是上下都增加了移动的距离,放大倍数则除以原始高度即可,反向则置为1
        scale = distance > 0 ? (realHeight + 2 * distance) / realHeight : 1;
        return Positioned(
            left: 0,
            right: 0,
            child: Transform.scale(
              scale: scale,
              child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/bg_home_headerA.png')),
            ));
      },
    );
  }

  ///头部
  Widget _headerView(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          _headImageView(),
          SafeArea(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 64),
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
                ),
                Container(child: _card(context))
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _messageView(BuildContext context) {
    return Container(
      ///容器高度必须是确定的
      height: 55,

      ///实际上里面还有容器,这里设置没办法对其里面的元素
//    alignment: Alignment.centerRight,
      child: Swiper(
        autoplay: true,
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          ///所有布局在里面完成
          return Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Text(
                  '消费者保护宣传条例宣传条例宣传条例宣传条例传条例宣传条例传条例宣传条例',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  softWrap: false,
                  style: TextStyle(fontSize: 14, color: HexColor("#333333")),
                ),
              ));
        },
      ),
    );
  }

}

