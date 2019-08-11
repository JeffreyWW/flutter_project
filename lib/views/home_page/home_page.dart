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
                    return _HomeHeader();
                  }

                  return Text("Jeff");
                },
              );
            }));
  }
}

class _HomeHeader extends StatelessWidget {
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
              ),
              onPressed: () {
                print("点击");
              },
            ),
            IconButton(
              icon: ImageIcon(
                AssetImage("assets/nav_message.png"),
              ),
              onPressed: () {
                print("点击2");
              },
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          children: <Widget>[navigationBar()],
        ),
      ),
      height: 400,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg_home_headerA.png"),
              fit: BoxFit.cover)),
    );
  }
}
