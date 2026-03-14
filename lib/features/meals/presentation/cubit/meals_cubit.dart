import 'package:flutter_food_app/models/meal_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_app/repositories/mealdao_repo.dart';

class MealsCubit extends Cubit<List<MealModels>> {
  MealsCubit() : super(<MealModels>[]);

  var mealRepo = MealDaoRepo();
  Future<void> mealsUpdate() async {
    var list = await mealRepo.mealsUpdate();
    emit(list);
  }
}
