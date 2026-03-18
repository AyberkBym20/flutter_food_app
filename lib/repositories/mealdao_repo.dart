import 'package:dio/dio.dart';
import 'package:flutter_food_app/features/meals/presentation/data/meal_remote_data_source.dart';
import 'package:flutter_food_app/models/meal_models.dart';
import 'dart:convert';

class MealDaoRepo {
  final Dio _dio = Dio();

  List<MealModels> parseMeals(dynamic answer) {
    final Map<String, dynamic> decodedData = jsonDecode(answer as String);
    return MealRemoteDataSource.fromJson(decodedData).meal;
  }

  Future<List<MealModels>> mealsUpdate() async {
    var url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
    var answer = await _dio.get(url);
    return parseMeals(answer.data);
  }

  Future<void> save({
    required String foodName,
    required String foodImage,
    required int foodPrice,
    required int foodOrderAmount,
    required String userName,
  }) async {
    var url = "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php";

    var data = {
      "yemek_adi": foodName,
      "yemek_resim_adi": foodImage,
      "yemek_fiyat": foodPrice,
      "yemek_siparis_adet": foodOrderAmount,
      "kullanici_adi": userName,
    };

    try {
      await _dio.post(url, data: FormData.fromMap(data));
    } catch (e) {
      print("Sepete ekleme hatası: $e");
    }
  }
}
