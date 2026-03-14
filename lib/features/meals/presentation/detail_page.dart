import 'package:flutter/material.dart';

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
            Image.asset(widget.model.imageUrl),
            Text(widget.model.name),
            Text(widget.model.price.toString()),
            ElevatedButton(onPressed: () {}, child: const Text('Add to cart')),
          ],
        ),
      ),
    );
  }
}
