import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_app/repositories/mealdao_repo.dart';

class DetailCubit extends Cubit<int> {
  DetailCubit() : super(1);
  var repo = MealDaoRepo();

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    if (state > 1) {
      emit(state - 1);
    }
  }

  Future<void> addToCart({
    required String foodName,
    required String foodImage,
    required int foodPrice,
  }) async {
    await repo.save(
      foodName: foodName,
      foodImage: foodImage,
      foodPrice: foodPrice,
      foodOrderAmount: state,
      userName: 'ayberk_dev',
    );
  }
}
