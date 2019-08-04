import 'package:flutter_project/models/food.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FoodState {}

class AllFoodFetch extends FoodState {}

class AllFoodLoaded extends FoodState {
  final List<Food> foodList;

  AllFoodLoaded(this.foodList);
}

class AllFoodError extends FoodState {}
