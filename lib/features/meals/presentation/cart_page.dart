import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_app/features/meals/presentation/cubit/cart_cubit.dart';
import 'package:flutter_food_app/models/cart_model.dart';
import 'package:flutter_food_app/models/meal_models.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().cartUpload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart Page")),
      body: BlocBuilder<CartCubit, List<CartMeals>>(
        builder: (context, mealList) {
          if (mealList.isNotEmpty) {
            return ListView.builder(
              itemCount: mealList.length,
              itemBuilder: (context, index) {
                var meal = mealList[index];
                debugPrint("Gelen Resim Adı: ${meal.imageName}");

                return ListTile(
                  leading: Image.network(
                    meal.imageName,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error),
                  ),

                  title: Text(meal.name),
                  subtitle: Text("${meal.cartId} adet - ₺${meal.price}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      context.read<CartCubit>().delete(int.parse(meal.cartId));
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("Sepetiniz boş"));
          }
        },
      ),
    );
  }
}
