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
    _foodBloc.dispatch(FoodGetEvent());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("食物列表"),
        ),
        body: BlocBuilder(
            bloc: _foodBloc,
            builder: (BuildContext context, FoodState state) {
              var currentState = state as AllFoodLoaded;
              return ListView.builder(
                itemCount: currentState.foodList.length,
                itemBuilder: (BuildContext context, int index) {
                  var currentFood = currentState.foodList[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(currentFood.name),
                      Text(currentFood.type.toString())
                    ],
                  );
                },
              );
            }));
  }
}
