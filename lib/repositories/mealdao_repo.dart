import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_food_app/features/meals/presentation/data/meal_remote_data_source.dart';
import 'package:flutter_food_app/models/meal_models.dart';

class MealDaoRepo {
  List<MealModels> parseMeals(String answer) {
    return MealRemoteDataSource.fromJson(json.decode(answer)).meal;
  }

  Future<List<MealModels>> mealsUpdate() async {
    var url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
    var answer = await Dio().get(url);
    return parseMeals(answer.data.toString());
  }
}
