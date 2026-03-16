class MealModels {
  final String id;
  final String name;
  final String imageUrl;
  final int price;

  MealModels({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
  });
  factory MealModels.fromJson(Map<String, dynamic> json) {
    String baseUrl = "http://kasimadalan.pe.hu/yemekler/resimler/";
    return MealModels(
      id: json['yemek_id'] as String,
      name: json['yemek_adi'] as String,
      imageUrl: "$baseUrl${json['yemek_resim_adi']}",
      price: int.parse(json['yemek_fiyat'].toString()),
    );
  }
}
