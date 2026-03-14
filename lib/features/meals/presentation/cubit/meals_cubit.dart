import 'package:flutter_food_app/models/meal_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_app/repositories/mealdao_repo.dart';

class MealsCubit extends Cubit<List<MealModels>> {
  final MealDaoRepo repo = MealDaoRepo();

  MealsCubit() : super([]) {
    getMeals();
  }
  Future<void> getMeals() async {
    print('1. Fonksiyon tetiklendi.');
    var list = await repo.mealsUpdate();
    print('2.Repo dan ${list.length}. tane veri geldi');

    emit(list);
  }
}
