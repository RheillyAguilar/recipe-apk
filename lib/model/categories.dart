

import 'package:flutter/cupertino.dart';
import 'package:recipe/widget/breakfast_category.dart';
import 'package:recipe/widget/dessert_category.dart';
import 'package:recipe/widget/dish_category.dart';
import 'package:recipe/widget/snack_category.dart';

class Category {
  String foodType;
  String imageFoodtpye;
  Widget destination;


  Category(
    {
      required this.foodType,
      required this.imageFoodtpye, 
      required this.destination

    }
  );
}

List<Category> categories =[

  Category(
    foodType: 'Breakfast',
    imageFoodtpye: 'assets/breakfast.png',
    destination: const BreakfastCategory(isType: 'breakfast',),
  ),
  Category(
    foodType: 'Dish',
    imageFoodtpye: 'assets/dish.png',
    destination: const DishCategory(isType: 'dish')
  ),
  Category(
    foodType: 'Dessert',
    imageFoodtpye: 'assets/dessert.png',
    destination: const DessertCategory(isType: 'dessert')
    
  ), 
  Category(
    foodType: 'Snack',
    imageFoodtpye: 'assets/snack.png',
    destination:  const SnackCategory(isType: 'snack')
    
  )


];