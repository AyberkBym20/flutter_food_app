import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_food_app/features/meals/presentation/data/meal_remote_data_source.dart';
import 'package:flutter_food_app/models/meal_models.dart';

class MealDaoRepo {
  final Dio _dio = Dio();

  List<MealModels> parseMeals(dynamic answer) {
    return MealRemoteDataSource.fromJson(answer).meal;
  }

  Future<List<MealModels>> mealsUpdate() async {
    var url =
        "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php"; // [cite: 84]
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
    var url =
        "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php"; // [cite: 86]

    var data = {
      "yemek_adi": foodName,
      "yemek_resim_adi": foodImage,
      "yemek_fiyat": foodPrice,
      "yemek_siparis_adet": foodOrderAmount,
      "kullanici_adi": userName,
    };

    try {
      // Veri gönderirken FormData.fromMap kullanmak Dio için doğru yaklaşımdır.
      await _dio.post(url, data: FormData.fromMap(data));
    } catch (e) {
      print("Sepete ekleme hatası: $e");
    }
  }
}
