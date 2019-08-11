import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/blocs/food/bloc.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State {
  void clickTest() {}
  final FoodBloc _foodBloc = FoodBloc();

  @override
  void initState() {
    super.initState();
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

    return Container(
      child: SafeArea(
        child: Column(
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
                  Text(
                    "北银消费金融",
                    style: Theme.of(context).textTheme.title,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      height: 400,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg_home_headerA.png"),
              fit: BoxFit.cover)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: BlocBuilder(
            bloc: _foodBloc,
            builder: (BuildContext context, FoodState state) {
              return ListView.builder(
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

