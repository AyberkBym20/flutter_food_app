import 'package:flutter_food_app/models/meal_models.dart';

class MealDaoRepo {
  Future<List<MealModels>> mealsUpdate() async {
    var list = <MealModels>[];

    var meal1 = MealModels(
      id: 1,
      name: 'Ayran',
      imageUrl: 'image/ayran.jpg',
      price: 25,
    );

    var meal2 = MealModels(
      id: 2,
      name: 'Köfte',
      imageUrl: 'image/köfte.png',
      price: 50,
    );

    var meal3 = MealModels(
      id: 3,
      name: 'Pilav',
      imageUrl: 'image/pilav.jpg',
      price: 75,
    );
    var meal4 = MealModels(
      id: 4,
      name: 'Pilav',
      imageUrl: 'image/pilav.jpg',
      price: 100,
    );
    list.add(meal1);
    list.add(meal2);
    list.add(meal3);
    list.add(meal4);

    return list;
  }
}
