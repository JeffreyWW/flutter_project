import 'package:flutter_project/models/food.dart';
import 'package:flutter_project/network/index.dart';
import 'package:rxdart/rxdart.dart';

class FoodRepositories {
  static Observable<List<Food>> getAllFoods() {
    return NetworkManager.post("/p/52b4e21a8160", data: {"name": "Jeff"})
        .flatMap((r) => Observable.just(
            [Food("大肉", FoodType.Meat), Food("苹果", FoodType.Fruits)]));
  }
}
