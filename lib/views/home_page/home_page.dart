import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/blocs/food/bloc.dart';
import 'package:flutter_project/utils/color.dart';

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

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
//
      print(scrollController.offset);
    });
  }

  ///头部
  Widget _headerView(BuildContext context) {
    Widget navigationBar() {
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

    Widget card(BuildContext context) {
      Widget number() {
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

      Widget divider() {
        return Divider(
          color: HexColor("#E6E6E6"),
          indent: 50,
          endIndent: 50,
        );
      }

      Padding descriptionElements(String message, String imagePtah) {
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

      Widget descriptions() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            descriptionElements("秒级到账", "assets/icon_shak.png"),
            Builder(
              builder: (BuildContext context) {
                return Text("Jeff");
              },
            )
          ],
        );
      }

      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 31, 16, 0),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
//        margin: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 19),
                child: cardFirstSection(),
              ),
              number(),
              Padding(
                  padding: const EdgeInsets.only(top: 15), child: divider()),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 21),
                  child: descriptions(),
                ),
              )
            ],
          ),
//        color: Colors.blue,
        ),
      );
    }

    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            child: Transform.scale(
              scale: 1,
              child: Image(
                width: 500,
                fit: BoxFit.fill,
                image: AssetImage("assets/bg_home_headerA.png"),
              ),
            ),
          ),
          SafeArea(
            child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                navigationBar(),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
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
                Container(child: card(context))
              ],
            ),
          )
        ],
      ),
      height: 400,
//      decoration: BoxDecoration(
//          image: DecorationImage(
//              image: AssetImage("assets/bg_home_headerA.png"),
//              fit: BoxFit.cover)),
    );
  }

  Row cardFirstSection() {
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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return new Scaffold(
        body: BlocBuilder(
            bloc: _foodBloc,
            builder: (BuildContext context, FoodState state) {
              return ListView.builder(
                controller: scrollController,
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 0),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return _headerView(context);
                  }

                  return Text("Jeff");
                },
              );
            }));
  }
}
