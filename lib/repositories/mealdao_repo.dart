import 'package:flutter_food_app/models/meal_models.dart';

class MealDaoRepo {
  Future<List<MealModels>> mealsUpdate() async {
    var list = <MealModels>[];

    var meal1 = MealModels(id: 1, name: 'Ayran', imageUrl: '', price: 25);

    var meal2 = MealModels(id: 2, name: 'Köfte', imageUrl: '', price: 50);

    var meal3 = MealModels(id: 3, name: 'Pilav', imageUrl: '', price: 75);
    list.add(meal1);
    list.add(meal2);
    list.add(meal3);

    return list;
  }
}
