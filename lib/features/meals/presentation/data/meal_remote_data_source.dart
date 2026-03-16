import 'package:flutter_food_app/models/meal_models.dart';

class MealRemoteDataSource {
  List<MealModels> meal;
  int success;
  MealRemoteDataSource({required this.meal, required this.success});
}
