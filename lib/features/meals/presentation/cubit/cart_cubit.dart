import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_app/models/cart_model.dart';
import 'package:flutter_food_app/repositories/mealdao_repo.dart';

class CartCubit extends Cubit<List<CartMeals>> {
  CartCubit() : super([]);

  final repo = MealDaoRepo();
  final String user =
      'ayberk_dev'; // Değişmeyeceği için final yapmak daha iyidir.

  Future<void> cartUpload() async {
    var list = await repo.getCartMeals(user);
    emit(list);
  }

  Future<void> delete(int cartFoodId) async {
    await repo.cartDelete(cartFoodId, user);
    await cartUpload();
  }
}
