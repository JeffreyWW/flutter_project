import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_project/network/request.dart';
import 'package:flutter_project/repositoies/food.dart';
import 'package:rxdart/rxdart.dart';
import './bloc.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  @override
  FoodState get initialState => AllFoodLoaded([]);

  @override
  Stream<FoodState> mapEventToState(FoodEvent event) {
    return FoodRepositories.getAllFoods().map((r){
      return AllFoodLoaded(r);
    }).onErrorReturn(AllFoodLoaded([]));
  }
}
