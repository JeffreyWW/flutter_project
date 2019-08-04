import 'package:flutter_project/models/food.dart';
import 'package:flutter_project/network/request.dart';
import 'package:rxdart/rxdart.dart';

class FoodRepositories {
  static Observable<List<Food>> getAllFoods() {
    return Request.get("").flatMap((r) => Observable.just(
        [Food("大肉", FoodType.Meat), Food("苹果", FoodType.Fruits)]));
  }
}
