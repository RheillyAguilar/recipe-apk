import 'package:flutter/material.dart';
import 'package:recipe/model/food.dart';
import 'package:recipe/widget/breakfast_box.dart';
import 'package:recipe/widget/dessert_box.dart';
import 'package:recipe/widget/dish_box.dart';
import 'package:recipe/widget/snack_box.dart';

class BoxDate extends StatefulWidget {
  const BoxDate({super.key});

  @override
  State<BoxDate> createState() => _BoxDateState();
}
class _BoxDateState extends State<BoxDate> {


  Food food = foods [0];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Row for Breakfast and Dish boxes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // breakfast area
                BreakfastBox(food: food, 
                onUpdate: (Food updatedFood ) {
                print('Updated');},),
                // Dish Box
                DishBox(food: food, onUpdate: (Food updatedFood) {
                  print('Updated');})
              ],
            ),
            const SizedBox(height: 20),
            // Row for Dessert and Snack boxes
            Row(
              children: [
                // Dessert Box
                DessertBox(food: food,
                onUpdate: (Food updatedFood) {
                  print('Updated');
                },),
                // Snack Box
                SnackBox(food: food,
                onUpdate: (Food updatedFood) {
                  print("'Updated");
                },)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
