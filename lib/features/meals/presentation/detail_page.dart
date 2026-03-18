import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_app/features/meals/presentation/cart_page.dart';
import 'package:flutter_food_app/features/meals/presentation/cubit/detail_cubit.dart';
import 'package:flutter_food_app/features/meals/presentation/cubit/meals_cubit.dart';

import 'package:flutter_food_app/models/meal_models.dart';

class DetailPage extends StatefulWidget {
  MealModels model;
  DetailPage({required this.model});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(widget.model.imageUrl),
            Text(widget.model.name),
            Text(widget.model.price.toString()),
            Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<DetailCubit>().increment();
                  },
                  child: const Icon(Icons.add),
                ),
                BlocBuilder<DetailCubit, int>(
                  builder: (context, state) {
                    return Text('$state', style: const TextStyle(fontSize: 24));
                  },
                ),

                ElevatedButton(
                  onPressed: () {
                    context.read<DetailCubit>().decrement();
                  },
                  child: const Icon(Icons.remove),
                ),
              ],
            ),

            ElevatedButton(
              onPressed: () {
                context
                    .read<DetailCubit>()
                    .addToCart(
                      foodName: widget.model.name,
                      foodImage: widget.model.imageUrl,
                      foodPrice: widget.model.price,
                    )
                    .then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${widget.model.name} sepete eklendi'),
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartPage()),
                      );
                    });
              },
              child: const Text('Add to cart'),
            ),
          ],
        ),
      ),
    );
  }
}
