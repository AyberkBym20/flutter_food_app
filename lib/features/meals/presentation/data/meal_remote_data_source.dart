import 'package:flutter_food_app/models/meal_models.dart';

class MealRemoteDataSource {
  List<MealModels> meal;
  int success;
  MealRemoteDataSource({required this.meal, required this.success});

  factory MealRemoteDataSource.fromJson(Map<String, dynamic> json) {
    var jsonArray = json['yemekler'] as List;
    int success = json['success'] as int;
    var meals = jsonArray
        .map((jsonArrayObject) => MealModels.fromJson(jsonArrayObject))
        .toList();

    return MealRemoteDataSource(meal: meals, success: success);
  }
}
