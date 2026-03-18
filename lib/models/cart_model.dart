class CartMeals {
  String cartId;
  String name;
  String imageName;
  String price;
  String orderAmount;
  String userName;

  CartMeals({
    required this.cartId,
    required this.name,
    required this.imageName,
    required this.price,
    required this.orderAmount,
    required this.userName,
  });

  factory CartMeals.fromJson(Map<String, dynamic> json) {
    return CartMeals(
      cartId: json["sepet_yemek_id"] as String,
      name: json["yemek_adi"] as String,
      imageName: json["yemek_resim_adi"] as String,
      price: json["yemek_fiyat"] as String,
      orderAmount: json["yemek_siparis_adet"] as String,
      userName: json["kullanici_adi"] as String,
    );
  }
}
