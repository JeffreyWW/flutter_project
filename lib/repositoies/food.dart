import 'package:flutter_project/models/food.dart';
import 'package:flutter_project/network/index.dart';
import 'package:rxdart/rxdart.dart';

class FoodRepositories {
  static Observable<List<Food>> getAllFoods() {
    return NetworkManager.get("https://www.baidu.com").flatMap((r) =>
        Observable.just(
            [Food("大肉", FoodType.Meat), Food("苹果", FoodType.Fruits)]));
  }
}
