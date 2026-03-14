import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_app/features/meals/presentation/cubit/meals_cubit.dart';
import 'package:flutter_food_app/models/meal_models.dart';

class MealsPage extends StatefulWidget {
  const MealsPage({super.key});

  @override
  State<MealsPage> createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  @override
  void initState() {
    super.initState();
    context.read<MealsCubit>().getMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meals')),
      body: BlocBuilder<MealsCubit, List<MealModels>>(
        builder: (context, mealList) {
          if (mealList.isNotEmpty) {
            return GridView.builder(
              itemCount: mealList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.8,
              ),
              itemBuilder: (context, index) {
                var meal = mealList[index];
                return Card(
                  elevation: 4,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Expanded(child: Image.asset(meal.imageUrl)),
                      Text(meal.name),
                      Text('${meal.price}'),
                      ElevatedButton(onPressed: () {}, child: Text('Add')),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No Data'));
          }
        },
      ),
    );
  }
}
