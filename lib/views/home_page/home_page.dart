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
//    _foodBloc.dispatch(FoodGetEvent());
  }

  Widget getHeader() {
    return Container(
//      child: Text("sdfsdfsdfsdfsdf"),
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage("assets/bg_home_headerA.png"))),
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
                    return getHeader();
                  }

                  return Text("Jeff");
                },
              );
            }));
  }
}
