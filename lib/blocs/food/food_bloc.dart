import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_project/repositoies/food.dart';

import './bloc.dart';

//ui层,网络层,仓库层,model层,bloc层
//ui层通过bloc输入event,bloc拿到event根据时间去仓库层获取数据并将数据转化为state,仓库层的数据通过网络层获取,bloc最后将拿到的数据给ui层显示
class FoodBloc extends Bloc<FoodEvent, FoodState> {
  @override
  FoodState get initialState => AllFoodLoaded([]);

  @override
  Stream<FoodState> mapEventToState(FoodEvent event) {
    return FoodRepositories.getAllFoods().map((r) {
      return AllFoodLoaded(r);
    }).onErrorReturn(AllFoodLoaded([]));
  }
}
