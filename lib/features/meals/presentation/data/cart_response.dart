import 'package:flutter_food_app/models/cart_model.dart';

class CartResponse {
  List<CartMeals> cartMeals;
  int success;

  CartResponse({required this.cartMeals, required this.success});

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["sepet_yemekler"] as List;

    List<CartMeals> cartList = jsonArray
        .map((jsonObjesi) => CartMeals.fromJson(jsonObjesi))
        .toList();

    return CartResponse(cartMeals: cartList, success: json["success"] as int);
  }
}
